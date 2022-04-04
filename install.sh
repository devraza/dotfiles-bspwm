sudo pacman -S zathura mpv dunst bspwm neofetch micro rofi sxhkd git
yay -S spotify-adblock-git spicetify-cli manga-cli-git ani-cli polybar cava  

git clone https://github.com/devraza/dotfiles
cd dotfiles
cp -r .config/* ~/.config/
cp -r .local/* ~/.local/
cp .Xresources ~/.Xresources
cp .xinitrc ~/.xinitrc

echo "All done!"
