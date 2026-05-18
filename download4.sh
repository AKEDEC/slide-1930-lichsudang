#!/bin/bash
cd "/Users/ledinhdung/Desktop/kiệt/slide-1930/images"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

dl() {
  curl -sL -A "$UA" -o "$1" "$2"
  printf "%-30s %-10s %s\n" "$1" "$(file -b --mime-type "$1")" "$(stat -f%z "$1")"
  sleep 2
}

dl hanoi-bxp-1946.jpg     "https://upload.wikimedia.org/wikipedia/commons/6/6d/Hano%C3%AF_1946%2C_Bui-xuan-Phai.jpg"
dl hanoi-paulbert.jpg     "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Hano%C3%AF_-_Rue_Paul_Bert.jpg/1280px-Hano%C3%AF_-_Rue_Paul_Bert.jpg"
dl vietnam-oldmap.jpg     "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Old_map_of_Vietnam.jpg/1280px-Old_map_of_Vietnam.jpg"
dl hanoi-police.jpg       "https://upload.wikimedia.org/wikipedia/commons/f/f2/Hanoi_police_with_European_and_indigenous_officers_%281900%27s%29.jpg"
dl rice-fields.jpg        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Vietnamese_rice_fields.jpg/1280px-Vietnamese_rice_fields.jpg"
dl newspaper-1919.jpg     "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Ban_Bi%C3%AAn_t%E1%BA%ADp_b%C3%A1o_Trung_B%E1%BA%AFc_T%C3%A2n_V%C4%83n_1919.jpg/1280px-Ban_Bi%C3%AAn_t%E1%BA%ADp_b%C3%A1o_Trung_B%E1%BA%AFc_T%C3%A2n_V%C4%83n_1919.jpg"
