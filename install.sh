sudo pacman -S zathura mpv dunst bspwm neofetch micro rofi sxhkd
yay -S spotify-adblock-git spicetify-cli manga-cli-git ani-cli polybar eww cava  

git clone https://github.com/devraza/dotfiles
cd dotfiles
cp .config/* ~/.config/

echo All done!
