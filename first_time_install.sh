#!/bin/bash

# Disable CAPSLOCK
setxkbmap -option caps:escape
# Add user  as NOPASSD user in sudoers
sudo sed -i '/^root/a eggster  ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
sudo ls -l /etc/sudoers./
# Remove the file listed from ls command:
sudo rm /etc/sudoers.d/*
# Update mirrorlist
sudo pacman-mirrors -c Sweden
# Update pacman
sudo pacman -Syu
sudo pacman -S --needed base-devel git
mkdir GIT
cd GIT
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
# Install all apps
yay -R palemoon-bin
yay -S virtualbox gammastep firefox zsh xautolock pavucontrol tor-browser pulseaudio pulseaudio-alsa pulseaudio-bluetooth pa-applet lm_sensors rofi xss-lock x11-ssh-askpass python-pygments thefuck cpulimit perl-anyevent-i3 wf-recorder pinta telegram-desktop  community/ttf-inconsolata jq timeshift acpid thermald clamav iptables gufw ufw thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman transmission-gtk gzip audacity feh alacritty iotop latop-mode-tools iperf3 xorg-xev signal-desktop extra/python-pip gtop kubectl sysstat i3blocks android-tools thunderbird mplayer nodejs-lts-gallium veracrypt sway swayidle swaylock interception-tools interception-caps2esc xorg-xwayland acpid python python-pip python3 python2

pip install --user alacritty-colorscheme 

# Install all aur packages
yay -S brave-bin 1password clamav-unofficial-sigs cpupower-gui dropbox dropbox-cli grimshot-git kazam mongodb-bin nerd-fonts-inconsolata prospect-mail-bin robo3t-bin spotify teams termite thunar-dropbox
# Change shell to zsh
chsh -s /bin/zsh

if ! pgrep dropbox; then
    (dropbox &>/dev/null &)
fi

alacritty-colorscheme -V apply gruvbox_dark.yaml
(alacritty &>/dev/null &) 
exit 0
