#!/bin/bash

#Install packages - assumes multilib enabled
sudo pacman -Syyu mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon mesa-vdpau lib32-mesa-vdpau libva-mesa-driver lib32-libva-mesa-driver xorg sddm plasma python3 python-pip libreoffice kitty transmission-qt firefox calibre leafpad nomacs okular flameshot dolphin vlc openssh latte-dock discord ntfs-3g htop neofetch adobe-source-han-sans-jp-fonts noto-fonts-emoji cronie rsync unrar wget docker bash-completion net-tools krita kdenlive ark arch-audit p7zip

#Enable installed services
sudo systemctl enable sddm fstrim.timer docker

#Add user to docker group
sudo usermod -aG docker $USER

#Git clone yay
sudo git clone https://aur.archlinux.org/yay-git.git

#Change ownership of yay folder
sudo chown -R $USER:$USER ./yay-git

#Makepkg
cd yay-git
makepkg -si PKGBUILD

#Install Aur packages
yay -Syyu ttf-ms-fonts timeshift hakuneko-desktop google-keep-nativefier visual-studio-code-bin

#Set env
echo setxkbmap tr >> ~/.bashrc

#Enable Radeon VRR
cat << EOF >> /etc/X11/xorg.conf.d/20-amdgpu.conf
Section "Device"
     Identifier "AMD"
     Driver "amdgpu"
     Option "TearFree" "true"
     Option "VariableRefresh" "true"
EndSection
EOF

#Create 1GB swap file
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile swap swap defaults 0 0 >> /etc/fstab
