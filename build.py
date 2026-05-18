#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
build.py — Gop slide thanh file index.html tu chay doc lap.

Doc file goc "Slide Lich Su Dang_101.html", tim moi tham chieu anh dang
<img src="images/..."> va thay bang data URI base64, xuat ra index.html.

Cach dung:   python3 build.py
"""

import base64
import mimetypes
import re
import sys
from pathlib import Path

# --- Cau hinh: doi ten file goc o day neu can ----------------------------
SOURCE = "Slide Lịch Sử Đảng_101.html"
OUTPUT = "index.html"
IMAGES_DIR = "images"
# -------------------------------------------------------------------------

ROOT = Path(__file__).resolve().parent


def to_data_uri(img_path: Path) -> str:
    """Tra ve chuoi data URI base64 cho mot file anh."""
    mime, _ = mimetypes.guess_type(img_path.name)
    if mime is None:
        # mac dinh cho .jpg/.png neu khong doan duoc
        mime = "image/jpeg" if img_path.suffix.lower() in {".jpg", ".jpeg"} else "image/png"
    data = base64.b64encode(img_path.read_bytes()).decode("ascii")
    return f"data:{mime};base64,{data}"


def main() -> int:
    src_file = ROOT / SOURCE
    if not src_file.exists():
        print(f"[LOI] Khong tim thay file goc: {SOURCE}")
        return 1

    html = src_file.read_text(encoding="utf-8")

    # Bat ca src="images/..." va src='images/...'
    pattern = re.compile(r'src=(["\'])(' + re.escape(IMAGES_DIR) + r'/[^"\']+)\1')

    missing: list[str] = []
    embedded: list[str] = []

    def replace(match: re.Match) -> str:
        quote, rel_path = match.group(1), match.group(2)
        img_file = ROOT / rel_path
        if not img_file.exists():
            missing.append(rel_path)
            return match.group(0)  # giu nguyen neu thieu anh
        embedded.append(rel_path)
        return f"src={quote}{to_data_uri(img_file)}{quote}"

    bundled = pattern.sub(replace, html)

    if missing:
        print("[LOI] Thieu cac file anh sau trong folder images/:")
        for m in sorted(set(missing)):
            print(f"   - {m}")
        print("Da DUNG, chua ghi index.html. Hay bo sung anh roi chay lai.")
        return 1

    out_file = ROOT / OUTPUT
    out_file.write_text(bundled, encoding="utf-8")

    size_mb = out_file.stat().st_size / (1024 * 1024)
    print(f"[OK] Da gop {len(embedded)} anh vao {OUTPUT}")
    print(f"     Kich thuoc: {size_mb:.1f} MB")
    print(f"     Mo {OUTPUT} bang trinh duyet de kiem tra truoc khi commit.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
