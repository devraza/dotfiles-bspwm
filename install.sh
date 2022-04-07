sudo pacman -S xorg-xinit xorg zathura mpv dunst bspwm neofetch micro rofi sxhkd git ncmpcpp mpd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -S polybar cava  

git clone https://github.com/devraza/dotfiles
cd dotfiles
cp -r .config/* ~/.config/
cp -r .local/* ~/.local/
cp .Xresources ~/.Xresources
cp .xinitrc ~/.xinitrc

echo "All done!"
