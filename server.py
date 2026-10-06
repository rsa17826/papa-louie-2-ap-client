import os
import math
from pathlib import Path
from flask import Flask, render_template_string, request, send_from_directory

app = Flask(__name__)

# Define supported image extensions
IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".webp", ".gif", ".bmp", ".svg"}

# HTML Template with pagination and lazy loading
HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Local Image Gallery (Paginated)</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f4f6f9;

            color: #333;

            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 10px;
        }
        .stats {
            text-align: center;
            color: #666;

            margin-bottom: 20px;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            max-width: 1400px;
            margin: 0 auto 30px auto;
        }
        .card {
            background: #fff;

            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .image-container {
            width: 100%;
            height: 200px;
            background-color: #eee;

            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .info {
            padding: 15px;
            font-size: 13px;
            word-break: break-all;
        }
        .info p {
            margin: 4px 0;
        }
        .label {
            font-weight: bold;
            color: #555;

        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }
        .pagination a, .pagination span {
            padding: 8px 14px;
            background: #fff;

            border: 1px solid #ddd;
            border-radius: 4px;
            color: #007bff;

            text-decoration: none;
            font-size: 14px;
        }
        .pagination a:hover {
            background: #007bff;

            color: #white;

            color: #fff;

        }
        .pagination .active {
            background: #007bff;

            color: #fff;

            border-color: #007bff;

        }
        .pagination .disabled {
            color: #ccc;

            pointer-events: none;
            background: #f9f9f9;

        }
    </style>
</head>
<body>
    <h1>Local Image Gallery</h1>
    <div class="stats">
        Found <strong>{{ total_images }}</strong> total images.
        Showing page <strong>{{ page }}</strong> of <strong>{{ total_pages }}</strong> ({{ per_page }} per page).
    </div>

    <div class="gallery">
        {% for img in images %}
        <div class="card">
            <div class="image-container">
                <!-- loading="lazy" defers loading off-screen images -->
                <img src="/view/{{ img.relative_path }}" alt="{{ img.filename }}" loading="lazy">
            </div>
            <div class="info">
                <p><span class="label">Filename:</span> {{ img.filename }}</p>
                <p><span class="label">Path:</span> ./{{ img.relative_path }}</p>
            </div>
        </div>
        {% endfor %}
    </div>

    <!-- Pagination Controls -->
    <div class="pagination">
        <a href="/?page=1" class="{% if page <= 1 %}disabled{% endif %}">&laquo; First</a>
        <a href="/?page={{ page - 1 }}" class="{% if page <= 1 %}disabled{% endif %}">&lsaquo; Prev</a>

        {% set start_p = [1, page - 3] | max %}
        {% set end_p = [total_pages, page + 3] | min %}

        {% for p in range(start_p, end_p + 1) %}
            <a href="/?page={{ p }}" class="{% if p == page %}active{% endif %}">{{ p }}</a>
        {% endfor %}

        <a href="/?page={{ page + 1 }}" class="{% if page >= total_pages %}disabled{% endif %}">Next &rsaquo;</a>
        <a href="/?page={{ total_pages }}" class="{% if page >= total_pages %}disabled{% endif %}">Last &raquo;</a>
    </div>
</body>
</html>
"""

# Cache the image list globally in memory so it doesn't rescan the disk on every single page click
CACHED_IMAGES = []


def get_images():
  global CACHED_IMAGES
  if not CACHED_IMAGES:
    root_dir = Path(".")
    found = []
    for path in root_dir.rglob("*"):
      if path.is_file() and path.suffix.lower() in IMAGE_EXTENSIONS:
        if any(part.startswith(".") for part in path.parts):
          continue

        rel_path = path.relative_to(root_dir)
        found.append({"filename": path.name, "relative_path": str(rel_path).replace("\\", "/")})


    CACHED_IMAGES = sorted(found, key=lambda x: x["relative_path"])

  return CACHED_IMAGES


@app.route("/")
def index():
  all_images = get_images()
  total_images = len(all_images)

  per_page = 500 # Number of images per page
  total_pages = math.ceil(total_images / per_page) if total_images > 0 else 1

  # Get current page from query string, default to 1
  try:
    page = int(request.args.get("page", 1))

  except ValueError:
    page = 1

  page = max(1, min(page, total_pages))

  start_idx = (page - 1) * per_page
  end_idx = start_idx + per_page
  page_images = all_images[start_idx:end_idx]

  return render_template_string(HTML_TEMPLATE, images=page_images, page=page, total_pages=total_pages, total_images=total_images, per_page=per_page)


@app.route("/view/<path:filename>")
def view_image(filename):
  root_dir = os.path.abspath(".")
  return send_from_directory(root_dir, filename)


if __name__ == "__main__":
  print("Scanning directory for images (this may take a moment for ~19k files)...")
  get_images() # Pre-cache on startup
  print(f"Found {len(CACHED_IMAGES)} images.")
  print("Starting server... Open http://127.0.0.1:5000 in your browser.")
  app.run(host="0.0.0.0", port=5000, debug=False)
