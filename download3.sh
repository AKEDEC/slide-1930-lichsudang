#!/bin/bash
cd "/Users/ledinhdung/Desktop/kiệt/slide-1930/images"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

download() {
  local name="$1"
  local url="$2"
  if [ -f "$name" ]; then
    mime=$(file -b --mime-type "$name")
    if [ "$mime" = "image/jpeg" ] || [ "$mime" = "image/png" ]; then
      printf "%-30s SKIP\n" "$name"; return
    fi
  fi
  for i in 1 2 3 4 5; do
    rm -f "$name"
    curl -sL -A "$UA" -o "$name" "$url"
    mime=$(file -b --mime-type "$name")
    sz=$(stat -f%z "$name")
    if [ "$mime" = "image/jpeg" ] || [ "$mime" = "image/png" ]; then
      printf "%-30s ok  %-10s %s\n" "$name" "$mime" "$sz"; return
    fi
    sleep 4
  done
  printf "%-30s FAIL\n" "$name"
}

download nghe-tinh-flag.png      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Nghe_Tinh_Soviet_Movement.svg/1280px-Flag_of_Nghe_Tinh_Soviet_Movement.svg.png"
sleep 1
download xo-viet-museum.jpg      "https://upload.wikimedia.org/wikipedia/commons/9/91/Museum_of_Xo_Viet_Nghe_Tinh.jpg"
sleep 1
download viet-minh-revolution.jpg "https://upload.wikimedia.org/wikipedia/commons/6/61/Viet_Minh_during_August_Revolution.jpg"
sleep 1
download farmers-arrested.png    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Farmers_in_Indochina_arrested_by_French_colonial_authorities_-_unknown_date.png/1280px-Farmers_in_Indochina_arrested_by_French_colonial_authorities_-_unknown_date.png"
sleep 1
download hcm-drawing.png         "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Ho_Chi_Minh_Drawing_Transparent.svg/1280px-Ho_Chi_Minh_Drawing_Transparent.svg.png"
sleep 1
download uncle-ho.jpg            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Uncle_Ho_%281345978089%29.jpg/1280px-Uncle_Ho_%281345978089%29.jpg"
sleep 1
download independence-1945.png   "https://upload.wikimedia.org/wikipedia/commons/2/20/1945_Vietnam_Independence_or_Death.png"
sleep 1
download hcm-statue.jpg          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Ho_Chi_Minh_%287166037769%29.jpg/1280px-Ho_Chi_Minh_%287166037769%29.jpg"
