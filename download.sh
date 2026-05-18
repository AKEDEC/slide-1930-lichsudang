#!/bin/bash
cd "/Users/ledinhdung/Desktop/kiệt/slide-1930/images"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

download() {
  curl -sL -A "$UA" -o "$1" "$2"
  printf "%-30s %-10s %s\n" "$1" "$(file -b --mime-type "$1")" "$(stat -f%z "$1")"
}

download hcm-cover.jpg          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Ho_Chi_Minh_-_1946_Portrait.jpg/1280px-Ho_Chi_Minh_-_1946_Portrait.jpg"
download hcm-1946.jpg            "https://upload.wikimedia.org/wikipedia/commons/1/1c/Ho_Chi_Minh_1946.jpg"
download hcm-1930-prison.png     "https://upload.wikimedia.org/wikipedia/commons/c/c7/Ho_Chi_Minh_%28Sung_Man_Cho%29%2C_Victoria_Prison%2C_1930.png"
download naq-30-france.jpg       "https://upload.wikimedia.org/wikipedia/commons/3/37/Comrade_Nguyen_Ai_Quoc_at_the_age_of_30_in_France.jpg"
download naq-1923-ussr.jpg       "https://upload.wikimedia.org/wikipedia/commons/e/e4/Comrade_Nguyen_Ai_Quoc_in_the_Soviet_Union_in_1923.jpg"
download naq-1924.jpg            "https://upload.wikimedia.org/wikipedia/commons/8/89/Comrade_Nguyen_Ai_Quoc_%281924%29.jpg"
download tran-phu.jpg            "https://upload.wikimedia.org/wikipedia/commons/1/13/Tr%E1%BA%A7n_Ph%C3%BA.jpg"
download tran-phu-tbt.jpg        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/TBT_Tr%E1%BA%A7n_Ph%C3%BA.jpg/1280px-TBT_Tr%E1%BA%A7n_Ph%C3%BA.jpg"
download cpv-flag.png            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Flag_of_the_Communist_Party_of_Vietnam.svg/1280px-Flag_of_the_Communist_Party_of_Vietnam.svg.png"
download yen-bai-1930.png        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Portraits_of_13_nationalists_executed_in_Yen-Bay_on_17_June_1930.png/1280px-Portraits_of_13_nationalists_executed_in_Yen-Bay_on_17_June_1930.png"
download comintern.png           "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Comintern_Logo.svg/1280px-Comintern_Logo.svg.png"
download marx-engels-lenin.png   "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Marx_Engels_Lenin.svg/1280px-Marx_Engels_Lenin.svg.png"
download peasant-vietnam.jpg     "https://upload.wikimedia.org/wikipedia/commons/4/4e/Peasant_in_Vietnam.jpg"
download emblem-vietnam.png      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Emblem_of_Vietnam.svg/1280px-Emblem_of_Vietnam.svg.png"
download pac-bo.jpg              "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/P%C3%A1c_B%C3%B3.jpg/1280px-P%C3%A1c_B%C3%B3.jpg"
download nha-rong.jpg            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/B%E1%BA%BFn_Nh%C3%A0_R%E1%BB%93ng_v%C3%A0_c%E1%BA%A7u_Kh%C3%A1nh_H%E1%BB%99i.JPG/1280px-B%E1%BA%BFn_Nh%C3%A0_R%E1%BB%93ng_v%C3%A0_c%E1%BA%A7u_Kh%C3%A1nh_H%E1%BB%99i.JPG"
