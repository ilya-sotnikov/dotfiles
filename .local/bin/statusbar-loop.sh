delimeter=" | "
while true; do
    statusbar=" "
    statusbar+="vol: $(volctl.sh -q)$delimeter"
    statusbar+="kbd: $(xkb-layout-get)$delimeter"
    statusbar+=$(date +"%F %a %R")
    statusbar+=" "
    xsetroot -name "$statusbar"
    sleep 30s
done
