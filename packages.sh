# install packages
sudo pacman -S xorg xorg-xinit i3-gaps i3lock i3status i3blocks dmenu rofi terminator firefox feh thunderbird picom thunar materia-gtk-theme papirus-icon-theme lxappearance

# install yay
cd
git clone git@github.com:Jguer/yay.git .yay_clone
cd .yay_clone
makepkg -si
cd

# spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811058.gpg | gpg --import
yay -S spotify

yay -S i3lock-color-git
