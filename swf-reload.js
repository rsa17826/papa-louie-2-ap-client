const KEY = "swfWatch"

async function headSig(url) {
  const res = await fetch(url, { method: "HEAD", cache: "no-store" })
  if (!res.ok) throw new Error(`HEAD ${url} -> ${res.status}`)
  const sig = ["etag", "last-modified", "content-length"]
    .map(h => res.headers.get(h))
    .join("|")
  if (sig === "||") {
    throw new Error(`HEAD ${url} returned no etag, last-modified or content-length`)
  }
  return sig
}

// Records the signature that triggered the reload and flags that a reload is
// in progress, so the next page load can verify nothing changed in between.
function reloadWith(sig) {
  localStorage.setItem(KEY, JSON.stringify({ sig, reloading: true }))
  location.reload()
}

// Call this BEFORE creating the player. It resolves with a version string for
// the swf as it is right now (use it as a cache-busting ?v= on the swf url).
// If the swf changed again while the page was reloading, it reloads instead
// and never resolves.
async function watchSwf(url, intervalMs = 500) {
  const sig = await headSig(url)
  const saved = JSON.parse(localStorage.getItem(KEY))

  if (saved?.reloading && saved.sig !== sig) {
    // a second change landed between the detected change and this page load
    reloadWith(sig)
    await new Promise(() => {})
  }

  localStorage.setItem(KEY, JSON.stringify({ sig, reloading: false }))

  const poll = async () => {
    try {
      const next = await headSig(url)
      if (next !== sig) {
        reloadWith(next)
        return
      }
    } catch (err) {
      console.error("swf watch:", err)
    }
    setTimeout(poll, intervalMs)
  }
  setTimeout(poll, intervalMs)

  return sig
}
