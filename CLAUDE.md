# Slide Lịch Sử Đảng — Hướng dẫn cho Claude Code

Repo này là slide thuyết trình HTML: so sánh Cương lĩnh chính trị (02/1930)
và Luận cương chính trị (10/1930). Gồm 27 slide.

## Cấu trúc file

| File | Vai trò |
|------|---------|
| `Slide Lịch Sử Đảng_101.html` | **FILE GỐC** — chỉ sửa file này. Dùng `<img src="images/...">`. |
| `images/` | 22 ảnh được file gốc tham chiếu (folder có 36 file, các ảnh còn lại là dự phòng). |
| `index.html` | **FILE BUNDLED** — ảnh đã nhúng base64, tự chạy độc lập. KHÔNG sửa tay. Dùng để thuyết trình + GitHub Pages serve. |
| `build.py` | Script gộp: đọc file gốc → xuất `index.html`. |

## QUY TẮC BẮT BUỘC

1. **Mọi chỉnh sửa nội dung, slide, CSS → CHỈ sửa `Slide Lịch Sử Đảng_101.html`.**
   Tuyệt đối không sửa trực tiếp `index.html` (nặng 25+ MB, ảnh là base64,
   không thể sửa tay và sẽ bị lệch khỏi file gốc).

2. **Thêm/đổi ảnh:** bỏ file ảnh vào `images/`, tham chiếu bằng
   `<img src="images/tên-ảnh.png">` trong file gốc.

3. **Sau khi sửa xong, regenerate bản bundled:** chạy `python3 build.py`.
   Script sẽ đọc file gốc, thay mọi `<img src="images/...">` bằng data URI
   base64, ghi đè `index.html`.

4. **Commit cả hai file** (`Slide Lịch Sử Đảng_101.html` và `index.html`)
   cùng folder `images/` nếu có ảnh mới, rồi push. GitHub Pages tự rebuild.

## Quy trình thường ngày

```
1. Sửa "Slide Lịch Sử Đảng_101.html"
2. python3 build.py
3. Mở index.html bằng trình duyệt để kiểm tra
4. git add -A && git commit -m "..." && git push
```

## Lưu ý khi xem trước (preview)

- Để xem bản đang sửa: mở **file gốc** `Slide Lịch Sử Đảng_101.html`
  (ảnh hiển thị nhờ folder `images/` nằm cạnh).
- KHÔNG mở `index.html` để xem tiến độ — đó là bản gộp cũ, chưa có
  thay đổi mới cho tới khi chạy lại `build.py`.

## Thuyết trình

- Có mạng: dùng link Pages → https://akedec.github.io/slide-1930-lichsudang/
- Không chắc có mạng: tải `index.html` về máy/USB, mở bằng trình duyệt
  (chạy được kể cả offline vì ảnh đã nhúng sẵn).

## ❌ KHÔNG deploy lên VPS

VPS (103.68.68.144) đã được loại bỏ khỏi workflow. **TUYỆT ĐỐI KHÔNG**
chạy `scp` lên VPS, không SSH lên `kiet@103.68.68.144`, không deploy lên
`C:\inetpub\wwwroot\slide-1930\`. Chỉ commit + push GitHub là đủ.
