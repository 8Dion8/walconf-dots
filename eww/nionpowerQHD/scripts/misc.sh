if [[ "$1" == "--ram" ]]; then
    RAWRAM=$(top -E g -bn1 | grep "Mem" | awk 'NR==1{print $8}')
    echo "${RAWRAM}"
elif [[ "$1" == "--bat" ]]; then
    BATTERY="$(cat /sys/class/power_supply/BAT0/capacity)"
    echo "${BATTERY}"
fi