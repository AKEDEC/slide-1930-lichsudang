#!/bin/bash
cd "/Users/ledinhdung/Desktop/kiệt/slide-1930/images"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

download() {
  local name="$1"
  local url="$2"
  # Only retry if file is missing or is HTML (small/text)
  if [ -f "$name" ]; then
    mime=$(file -b --mime-type "$name")
    if [ "$mime" = "image/jpeg" ] || [ "$mime" = "image/png" ]; then
      printf "%-30s SKIP (already ok)\n" "$name"
      return
    fi
  fi
  for i in 1 2 3 4 5; do
    rm -f "$name"
    curl -sL -A "$UA" -o "$name" "$url"
    mime=$(file -b --mime-type "$name")
    sz=$(stat -f%z "$name")
    if [ "$mime" = "image/jpeg" ] || [ "$mime" = "image/png" ]; then
      printf "%-30s ok  %-10s %s\n" "$name" "$mime" "$sz"
      return
    fi
    sleep 3
  done
  printf "%-30s FAIL\n" "$name"
}

download naq-30-france.jpg       "https://upload.wikimedia.org/wikipedia/commons/3/37/Comrade_Nguyen_Ai_Quoc_at_the_age_of_30_in_France.jpg"
sleep 1
download naq-1923-ussr.jpg       "https://upload.wikimedia.org/wikipedia/commons/e/e4/Comrade_Nguyen_Ai_Quoc_in_the_Soviet_Union_in_1923.jpg"
sleep 1
download naq-1924.jpg            "https://upload.wikimedia.org/wikipedia/commons/8/89/Comrade_Nguyen_Ai_Quoc_%281924%29.jpg"
sleep 1
download tran-phu.jpg            "https://upload.wikimedia.org/wikipedia/commons/1/13/Tr%E1%BA%A7n_Ph%C3%BA.jpg"
sleep 1
download tran-phu-tbt.jpg        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/TBT_Tr%E1%BA%A7n_Ph%C3%BA.jpg/1280px-TBT_Tr%E1%BA%A7n_Ph%C3%BA.jpg"
sleep 1
download yen-bai-1930.png        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Portraits_of_13_nationalists_executed_in_Yen-Bay_on_17_June_1930.png/1280px-Portraits_of_13_nationalists_executed_in_Yen-Bay_on_17_June_1930.png"
sleep 1
download emblem-vietnam.png      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Emblem_of_Vietnam.svg/1280px-Emblem_of_Vietnam.svg.png"
sleep 1
download pac-bo.jpg              "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/P%C3%A1c_B%C3%B3.jpg/1280px-P%C3%A1c_B%C3%B3.jpg"
sleep 1
download nha-rong.jpg            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/B%E1%BA%BFn_Nh%C3%A0_R%E1%BB%93ng_v%C3%A0_c%E1%BA%A7u_Kh%C3%A1nh_H%E1%BB%99i.JPG/1280px-B%E1%BA%BFn_Nh%C3%A0_R%E1%BB%93ng_v%C3%A0_c%E1%BA%A7u_Kh%C3%A1nh_H%E1%BB%99i.JPG"
