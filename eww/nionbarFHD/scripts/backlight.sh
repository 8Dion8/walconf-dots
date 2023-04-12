STATUS=$(brightnessctl | sed -n 2p | awk '{print $4}')

echo ${STATUS:1:-1}
