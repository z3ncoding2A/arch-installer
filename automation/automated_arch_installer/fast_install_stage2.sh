
echo "Inside Chroot Env"
echo
source /environment.sh
pwd
echo
echo ${PASSWORD}
echo ${USER}
echo ${DISK}
echo
echo "Press the [ANY] key to continue...."
read continue



echo "Installing Important Packages"

pacman -S --noconfirm man-pages man-db dnsutils ethtool iputils net-tools iproute2 openssh wget \
usbutils usb_modeswitch tcpdump smartmontools gnu-netcat mc dosfstools exfat-utils ntfs-3g \
partclone parted partimage gptfdisk iw wpa_supplicant dialog base-devel vim \
grub os-prober efivar efibootmgr efitools intel-ucode \
c7zip accountsservice airgeddon alsa-firmware alsa-plugins alsa-utils aria2 \
aria2p armitage atear autopsy autopwn awesome-terminal-fonts base base-devel bash-completion \
bat bc beautyline bind bindfs blackarch-helper blackarch-mirrorlist \
blackman bleachbit bluez-libs boopsuite bridge-utils brightnessctl broadcom-wl-dkms \
btop btrfs-progs cachyos-dnscrypt-proxycachyos-grub-themecachyos-hookscachyos-hyprland-settings \
cachyos-keyring cachyos-mirrorlist cachyos-plymouth-bootanimation cachyos-rate-mirrors cachyos-settings cachyos-sysctl-manager \
cachyos-v3-mirrorlist candy-icons-git cantarell-fonts ccache chaotic-keyring chaotic-mirrorlist chatblade \
chatgpt-desktop-bin cheat-bin cheat-sh cherrytree chwd cliphist code \
cpupower crunch cryptsetup device-mapper devtools dhclient dialog diffutils \
direnv discord dmidecode dmraid dnsmasq docker docker-buildx docker-compose-git \
dolphin dosfstools downgrade duf dunst e2fsprogs eaphammer efibootmgr efitools \
electron espeak-ng ethtool evince ex-vi-compat exfatprogs expac eza f2fs-tools fail2ban \
falkon fastfetch fern-wifi-cracker ffmpegthumbnailer ffmpegthumbs flatpak-git fluxion fsarchiver fuzzap \
fwupd fzf gcr gerix-wifi-cracker ghostty git github-desktop-bin glances \
gnome-disk-utility gnome-keyring gpart gparted gptfdisk grimblast-git grub grub-hook \
gst-libav gst-plugin-pipewire gst-plugin-va gst-plugins-bad gst-plugins-ugly gtksourceview5 gtksourceviewmm \
haveged hdparm hostapd-wpe hunspell hwdetect hwinfo hyde-cli-git \
hyprland hyprland-scratchpad-git hyprpicker inetutils infection-monkey intel-gmmlib-git intel-graphics-compiler \
intel-media-driver-git intel-media-sdk intel-ucode intel-undervolt intelmq intercepter-ng ipscan \
iptables-nft ipwm iwd jdk11-openjdk jdk17-openjdk jdownloader2 jfsutils jq \
kdiskmark kismet kitty kvantum kvantum-qt5 less lesspipe libdvdcss libgsf \
libopenraw libpthread-stubs libva-git libva-intel-driver libwnck3 libxcrypt-compat \
linset linutil-bin linux linux-firmware linux-headers logrotate lsb-release lsd \
lsscsi lvm2 lynx macchanger man-db man-pages mana mbpfan mdadm mdk3 mediainfo mesa \
mesa-utils mitmap mitmap-old mkinitcpio modemmanager morpheus msf-mpc msfenum msr-tools \
mtools multitail myrescue nano nano-syntax-highlighting ncdu net-tools netctl netdiscover \
netripper netstumbler nettacker networkmanager nfs-utils nilfs-utils noto-color-emoji-fontconfig \
noto-fonts noto-fonts-cjk noto-fonts-emoji nss-mdns ntp nwg-look nzyme occt octopi oh-my-zsh-git \
open-vm-tools-git openbsd-netcat opencl-mesa openssh openssl-1.0 orca os-prober pacman-contrib \
pacui pamac pamixer paru pavucontrol pcloud-drive penbox pentmenu perl phantomjs pidense pigz \
pipewire-alsa pipewire-jack pipewire-pulse pkgfile plocate plymouth pokemon-colorscripts-git \
polkit-gnome poppler-glib powertop pureblood pv pyrit python python-aiohttp python-aiosmtpd \
python-beautifulsoup4 python-defusedxml python-distro python-email-validator python-fastapi \
python-packaging python-pip python-pyasyncore python-pyinotify python-simplejson python-tqdm \
python-trackerjacker python-uv python-virtualenv python311 qemu-full qt5-graphicaleffects \
qt5-imageformats qt5-quickcontrols qt5-quickcontrols2 qt5-wayland qt5ct qt6-wayland qt6ct \
qtutilities-qt6 r rebuild-detector reflector ripgrep rockyou rofi roguehostapd rsync rtkit \
rustup-git s-nail sddm sddm-sugar-candy-git seahorse seclists secure-delete sg3_utils sleuthkit-git \
slurp smartmontools smplayer sof-firmware source-highlight speedtest++ speedtest-cli storebackup \
stremio stress sublime-merge sublime-text-4 sudo swappy swaylock-effects-git swaync swtpm swww \
sysfsutils texinfo thefatrat timeshift tk tldr tor-browser torctl transmission-gtk trash-cli \
tree ttf-bitstream-vera ttf-cascadia-code-nerd ttf-d2coding-nerd ttf-dejavu ttf-fantasque-nerd \
ttf-firacode-nerd ttf-hack-nerd ttf-liberation ttf-meslo-nerd ttf-opensans ttf-sourcecodepro-nerd \
udiskie ufw unrar unzip upower uriparser usb_modeswitch usbutils uv uvicorn vim virt-manager \
virt-viewer vlc vlc-plugins-all vulkan-broadcom vulkan-headers vulkan-intel vulkan-mesa-layers \
vuls w3m waybar wdict wepbuster wf-recorder wget which wi-feye wifi-autopwner wifi-pumpkin \
wifibroot wificurse wifijammer wifiphisher wifiscanmap wireless-ids wireless-regdb wireless_tools \
wireplumber wireshark-qt wlogout wmd wordlister wpa-bruteforcer wpa2-halfhandshake-crack \
x86_energy_perf_policy xclip xdg-desktop-portal-hyprland xdg-user-dirs xdg-utils xf86-input-evdev \
xf86-input-libinput xf86-input-synaptics xf86-input-vmmouse xf86-input-void xf86-video-ati \
xf86-video-dummy xf86-video-fbdev xf86-video-intel-git xf86-video-nouveau xf86-video-qxl \
xf86-video-vesa xf86-video-vmware xf86-video-voodoo xfce4-taskmanager xfsprogs xl2tpd xmlsec \
xorg-server xorg-xbacklight xorg-xdpyinfo xorg-xhost xorg-xinit xorg-xinput xorg-xkill xorg-xrandr \
yazi-nightly-bin youtube-dl yt-dlp zen-browser-bin zizzania zoxide zsh zsh-theme-powerlevel10k-git



cd /usr/bin/
ln -s vim vi
echo "set mouse=v" >>  ~/.vimrc


echo "Setup Timezone and Locale"


ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf


echo "Press the [ANY] key to continue...."
read continue


echo "Network Setup"

echo host1 > /etc/hostname


# for IPv6:
# DHCP=yes


echo "[Match]"         > /etc/systemd/network/20-wired.network
echo "Name=${NET}"     >> /etc/systemd/network/20-wired.network
echo ""                >> /etc/systemd/network/20-wired.network
echo "[Network]"       >> /etc/systemd/network/20-wired.network
echo "DHCP=ipv4"       >> /etc/systemd/network/20-wired.network
echo ""                >> /etc/systemd/network/20-wired.network
echo "[DHCPv6]"        >> /etc/systemd/network/20-wired.network
echo "UseDomains=true" >> /etc/systemd/network/20-wired.network



systemctl enable systemd-networkd
systemctl enable systemd-resolved


echo "Press the [ANY] key to continue...."
read continue

echo "Adding Users"

useradd -m -G wheel,users -s /bin/bash ${USER}
yes ${PASSWORD} | passwd
yes ${PASSWORD} | passwd ${USER}

echo "Installing GRUB"

mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install ${DISK}


echo "Enabling NTP"
systemctl enable systemd-timesyncd


echo "Press the [ANY] key to continue...."
read continue


echo "Exiting Chroot Environment"

exit
kdiskmark kismet kitty kvantum kvantum-qt5 less lesspipe libdvdcss libgsf \
libopenraw libpthread-stubs libva-git libva-intel-driver libwnck3 libxcrypt-compat \
linset linutil-bin linux linux-firmware linux-headers logrotate lsb-release lsd \
lsscsi lvm2 lynx macchanger man-db man-pages mana mbpfan mdadm mdk3 mediainfo mesa \
mesa-utils mitmap mitmap-old mkinitcpio modemmanager morpheus msf-mpc msfenum msr-tools \
mtools multitail myrescue nano nano-syntax-highlighting ncdu net-tools netctl netdiscover \
netripper netstumbler nettacker networkmanager nfs-utils nilfs-utils noto-color-emoji-fontconfig \
noto-fonts noto-fonts-cjk noto-fonts-emoji nss-mdns ntp nwg-look nzyme occt octopi oh-my-zsh-git \
open-vm-tools-git openbsd-netcat opencl-mesa openssh openssl-1.0 orca os-prober pacman-contrib \
pacui pamac pamixer paru pavucontrol pcloud-drive penbox pentmenu perl phantomjs pidense pigz \
pipewire-alsa pipewire-jack pipewire-pulse pkgfile plocate plymouth pokemon-colorscripts-git \
polkit-gnome poppler-glib powertop pureblood pv pyrit python python-aiohttp python-aiosmtpd \
python-beautifulsoup4 python-defusedxml python-distro python-email-validator python-fastapi \
python-packaging python-pip python-pyasyncore python-pyinotify python-simplejson python-tqdm \
python-trackerjacker python-uv python-virtualenv python311 qemu-full qt5-graphicaleffects \
qt5-imageformats qt5-quickcontrols qt5-quickcontrols2 qt5-wayland qt5ct qt6-wayland qt6ct \
qtutilities-qt6 r rebuild-detector reflector ripgrep rockyou rofi roguehostapd rsync rtkit \
rustup-git s-nail sddm sddm-sugar-candy-git seahorse seclists secure-delete sg3_utils sleuthkit-git \
slurp smartmontools smplayer sof-firmware source-highlight speedtest++ speedtest-cli storebackup \
stremio stress sublime-merge sublime-text-4 sudo swappy swaylock-effects-git swaync swtpm swww \
sysfsutils texinfo thefatrat timeshift tk tldr tor-browser torctl transmission-gtk trash-cli \
tree ttf-bitstream-vera ttf-cascadia-code-nerd ttf-d2coding-nerd ttf-dejavu ttf-fantasque-nerd \
ttf-firacode-nerd ttf-hack-nerd ttf-liberation ttf-meslo-nerd ttf-opensans ttf-sourcecodepro-nerd \
udiskie ufw unrar unzip upower uriparser usb_modeswitch usbutils uv uvicorn vim virt-manager \
virt-viewer vlc vlc-plugins-all vulkan-broadcom vulkan-headers vulkan-intel vulkan-mesa-layers \
vuls w3m waybar wdict wepbuster wf-recorder wget which wi-feye wifi-autopwner wifi-pumpkin \
wifibroot wificurse wifijammer wifiphisher wifiscanmap wireless-ids wireless-regdb wireless_tools \
wireplumber wireshark-qt wlogout wmd wordlister wpa-bruteforcer wpa2-halfhandshake-crack \
x86_energy_perf_policy xclip xdg-desktop-portal-hyprland xdg-user-dirs xdg-utils xf86-input-evdev \
xf86-input-libinput xf86-input-synaptics xf86-input-vmmouse xf86-input-void xf86-video-ati \
xf86-video-dummy xf86-video-fbdev xf86-video-intel-git xf86-video-nouveau xf86-video-qxl \
xf86-video-vesa xf86-video-vmware xf86-video-voodoo xfce4-taskmanager xfsprogs xl2tpd xmlsec \
xorg-server xorg-xbacklight xorg-xdpyinfo xorg-xhost xorg-xinit xorg-xinput xorg-xkill xorg-xrandr \
yazi-nightly-bin youtube-dl yt-dlp zen-browser-bin zizzania zoxide zsh zsh-theme-powerlevel10k-git
