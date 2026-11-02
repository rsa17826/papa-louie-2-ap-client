#!/usr/bin/env python3
"""Turn zoomed FFDec tile-sheet exports into exactly grid-aligned 1x sheets.

The 1x exports put the tile grid on fractional pixel positions (e.g. x = 24.75), so tile edges
straddle two pixel columns. At zoom Z the same grid lands on whole pixels, so:

  1. find the grid origin at zoom Z (where flat tile edges pile up modulo tile*Z),
  2. crop to whole cells starting at that origin,
  3. box-downsample by Z on premultiplied alpha (no colour bleeding from transparent pixels).

Every cell of the output is exactly TxT and every tile edge sits on a cell border, so use
padX = padY = 0 for these sheets in the viewer. Art outside the whole-cell grid is dropped
(the count is reported).

    python3 downscale_tiles.py IN_DIR OUT_DIR --tile 32 --zoom 4

Sheets without a detectable grid (e.g. decoration sheets) are reported and skipped.
"""
import argparse
import os
import sys

import numpy as np
from PIL import Image

Image.MAX_IMAGE_PIXELS = None
MIN_STRENGTH = 5.0 # edge-phase peak vs median needed to trust a grid


def detect_origin(op, cell):
    """Phase (mod cell) of flat opaque/transparent edges along x and y: [(phase, strength)]."""
    out = []
    for axis in (1, 0):
        t = op[:, :-1] != op[:, 1:] if axis == 1 else op[:-1, :] != op[1:, :]
        counts = t.sum(0) if axis == 1 else t.sum(1)
        hist = np.bincount((np.arange(len(counts)) + 1) % cell, weights=counts, minlength=cell)
        out.append((int(hist.argmax()), float(hist.max() / max(np.median(hist), 1.0))))
    return out


def process(path, out_path, tile, zoom):
    name = os.path.basename(path)
    rgba = np.asarray(Image.open(path).convert("RGBA"))
    h, w = rgba.shape[:2]
    if w % zoom or h % zoom:
        # FFDec rounds the zoomed bounds, so pad the sheet with transparency up to a multiple of the zoom
        rgba = np.pad(rgba, ((0, -h % zoom), (0, -w % zoom), (0, 0)))
        h, w = rgba.shape[:2]
    cell = tile * zoom
    (ox, sx), (oy, sy) = detect_origin(rgba[:, :, 3] > 127, cell)
    if sx < MIN_STRENGTH or sy < MIN_STRENGTH:
        print(f"{name}: SKIPPED, no tile grid found (edge peak vs median: x {sx:.1f}, y {sy:.1f})")
        return False
    cols, rows = (w - ox) // cell, (h - oy) // cell
    if cols < 1 or rows < 1:
        print(f"{name}: SKIPPED, grid origin ({ox},{oy}) leaves no whole cell in {w}x{h}")
        return False

    region = rgba[oy : oy + rows * cell, ox : ox + cols * cell].astype(np.float32) / 255.0
    a = region[:, :, 3:4]
    pm = np.concatenate([region[:, :, :3] * a, a], axis=2)
    pm = pm.reshape(rows * tile, zoom, cols * tile, zoom, 4).mean(axis=(1, 3))
    al = pm[:, :, 3:4]
    col = np.where(al > 0, pm[:, :, :3] / np.maximum(al, 1e-6), 0)
    out = np.clip(np.concatenate([col, al], axis=2) * 255 + 0.5, 0, 255).astype(np.uint8)
    Image.fromarray(out, "RGBA").save(out_path)

    keep = np.zeros((h, w), bool)
    keep[oy : oy + rows * cell, ox : ox + cols * cell] = True
    lost = int(((rgba[:, :, 3] > 127) & ~keep).sum()) // (zoom * zoom)
    print(f"{name}: {w}x{h} at {zoom}x, grid origin ({ox},{oy}) = ({ox / zoom:g},{oy / zoom:g}) at 1x, "
          f"{cols}x{rows} cells -> {cols * tile}x{rows * tile}; "
          f"~{lost} opaque 1x px outside the grid dropped (edge strength x {sx:.0f}, y {sy:.0f})")
    return True


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("in_dir")
    ap.add_argument("out_dir")
    ap.add_argument("--tile", type=int, required=True, help="tile size in px at 1x, e.g. 32")
    ap.add_argument("--zoom", type=int, required=True, help="zoom the sheets were exported at, e.g. 4")
    args = ap.parse_args()
    if not os.path.isdir(args.in_dir):
        sys.exit(f"{args.in_dir} is not a directory")
    os.makedirs(args.out_dir, exist_ok=True)
    files = sorted(f for f in os.listdir(args.in_dir) if f.lower().endswith(".png"))
    if not files:
        sys.exit(f"no .png files in {args.in_dir}")
    ok = [process(os.path.join(args.in_dir, f), os.path.join(args.out_dir, f), args.tile, args.zoom) for f in files]
    if not all(ok):
        sys.exit(1)


if __name__ == "__main__":
    main()
