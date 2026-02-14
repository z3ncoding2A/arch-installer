#
# wifi-menu -o wlo1
# lsblk
#
# Todo:
#
# prompt passwd, net, wifi (net and ), disk
# detect wifi, prompt password, wpa_supplicant
# wifi working with systemd-networkd
# add this to an install disk
# need to check for errors
# create a GUI
# need debug mode ( enable / disable press any key to continue )



USER="z3ncoding"
PASSWORD="123"
NET=`ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}'|head -n 1`
WIFI_NIC=`ip -br l | awk '$1 ~ "wl" { print $1}'|head -n 1`
ALL_NICS=`ip -br l | awk '{ print $1}'`
DISK1=`lsblk -dn |awk '{print $1}'|grep -E "sda|nvme|vda"|head 
-n 1`
SWAP_SIZE=`free -m|grep -i Mem: | awk '{print $2}'`     # swap set to RAM size to support hibernate


echo
echo "NOTE: "
echo "  * This script will setup system to use DHCP by default."
echo "  * If you have a single wired NIC on a network with DHCP it should work by default."
echo "  * Same password is the same for root and non root user by default. Change this after install or override."
echo "  * The default selected disk is the first block device found."
echo "  * This installer should support both BIOS and UEFI."
echo "  * Swap is set to be equal to the amount of RAM on the system ( needed for hibernation to work )."
echo "  * Timezone, locale, and keyboard layout are hardcoded.  Override if needed."
echo;echo

echo "Default non-root user: ${USER}"
echo "Default password: ${PASSWORD}"
echo

WIFI_NIC=`ip -br l | awk '$1 ~ "wl" { print $1}'|head -n 1`
if [[ ! -z ${WIFI_NIC} ]]; then
    echo "Wifi NIC found - consider configuring before running installer"
    echo
fi

echo "Selected wired interface: "
echo $NET
echo "All interfaces found:"
echo $ALL_NICS
echo

echo "Selected disk:"
echo $DISK1
echo

echo "Disks on system:"
lsblk -d
echo

echo "Swap Size: "
echo $SWAP_SIZE
echo

echo "Press the [ANY] key to continue...."
read continue


DISK="/dev/$DISK1"



echo export USER=${USER} > environment.sh
echo export PASSWORD=${PASSWORD} >> environment.sh
echo export NET=${NET} >> environment.sh
echo export WIFI_NIC=${WIFI_NIC} >> environment.sh
echo export ALL_NICS=${ALL_NICS} >> environment.sh
echo export DISK1=${DISK1} >> environment.sh
echo export SWAP_SIZE=${SWAP_SIZE} >> environment.sh
echo export DISK=${DISK} >> environment.sh

EOF

chmod a+x environment.sh



echo
echo "Using existing partition layout — NO disk wipe."

ROOT_PART="${DISK}3"
EFI_PART="${DISK}1"
HOME_LUKS_PART="${DISK}2"

echo
echo "Formatting root and EFI partitions only..."

# Format root
mkfs.ext4 -F ${ROOT_PART}

# Format EFI
mkfs.vfat -F 32 ${EFI_PART}

echo
echo "Opening existing LUKS /home partition..."

cryptsetup luksOpen ${HOME_LUKS_PART} homecrypt

echo
echo "Mounting filesystems..."

# Mount root
mount ${ROOT_PART} /mnt

# Create mount points
mkdir -p /mnt/boot/efi
mkdir -p /mnt/home

# Mount EFI
mount ${EFI_PART} /mnt/boot/efi

# Mount decrypted home
mount /dev/mapper/homecrypt /mnt/home

echo
echo "Pacstrapping System..."

pacstrap -K /mnt base linux linux-headers linux-firmware broadcom-wl-dkms git base-devel intel-ucode

echo
echo "Generating fstab..."

genfstab -U /mnt >> /mnt/etc/fstab

echo
echo "Adding crypttab entry for /home..."

UUID_HOME=$(blkid -s UUID -o value ${HOME_LUKS_PART})
echo "homecrypt UUID=${UUID_HOME} none luks" >> /mnt/etc/crypttab

echo
echo "Done with partition setup."


echo "Press the [ANY] key to continue...."
read continue

echo
echo ${PASSWORD}
echo ${USER}
echo ${DISK}
echo
echo "Entering Chroot Environment"


cp fast_install_stage2.sh /mnt
cp environment.sh /mnt

#arch-chroot /mnt /fast_install_stage2.sh

echo
echo "One Last Link"


ln -sf /run/systemd/resolve/stub-resolv.conf /mnt/etc/resolv.conf

echo
echo "All Set"
echo "Press the [ANY] key to reboot...."
read continue


reboot




