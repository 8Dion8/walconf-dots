#!/bin/python
import pywal, os, random
import colorsys
import colormap

WALLPAPERDIR = "/home/dion/Pictures/Wallpapers"
PREVCACHE = "/home/dion/.cache/past_wallpapers.txt"

WALLPAPERS = []

for dirname in os.listdir(WALLPAPERDIR):
    WALLPAPERS.extend([os.path.join(WALLPAPERDIR, dirname, i) for i in os.listdir(os.path.join(WALLPAPERDIR, dirname))])

with open(PREVCACHE, "r") as f:
    lines = f.readlines()
    past_wallpapers = [line.rstrip() for line in lines]

while True:
    chosen_wallpaper = random.choice(WALLPAPERS)
    if chosen_wallpaper not in past_wallpapers:
        break

past_wallpapers.pop(0)
past_wallpapers.append(chosen_wallpaper)

with open(PREVCACHE, "w") as f:
    f.write("\n".join(past_wallpapers))

os.system("/home/dion/.config/eww/nionpowerQHD/closeall.sh")
os.system(f"wal -i {chosen_wallpaper}")
os.system(f"feh --bg-fill {chosen_wallpaper}")
os.system("pywalfox update")
os.system("pywal-discord")
os.system("/home/dion/gitclones/eww/target/release/eww reload -c /home/dion/.config/eww/nionbarQHD/")
os.system("/home/dion/gitclones/eww/target/release/eww reload -c /home/dion/.config/eww/nionbarFHD/")
os.system("/home/dion/gitclones/eww/target/release/eww reload -c /home/dion/.config/eww/nionpowerQHD/")
os.system("wal-telegram --wal --tiled -r")
os.system("/home/dion/.config/eww/nionpowerQHD/scripts/openall.sh")
os.system("rm ~/.Xresources")
os.system("cat ~/.cache/wal/colors.Xresources >> ~/.Xresources")
#os.system("echo 'Xft.dpi: 144' >> ~/.Xresources")
os.system("kitty /home/dion/.config/awesome/reload-spotify.sh")
#os.system("spotify")
#os.system(f"betterlockscreen -u {chosen_wallpaper}")
