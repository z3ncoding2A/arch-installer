#!/bin/bash

# Set the backup directory path (you should change this if needed)
BACKUP_DIR="/path/to/backup/directory"
MOUNT_DIR="/mnt"  # Mount point of your fresh Arch system

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "You must run this script as root."
    exit 1
fi

# Step 1: Restore the system files using rsync
echo "Restoring system files..."
rsync -aAXv $BACKUP_DIR/ $MOUNT_DIR/ --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found}

# Step 2: Restore the bootloader (GRUB example)
echo "Restoring bootloader..."
# Reinstall GRUB (adjust for your system if needed)
grub-install --target=x86_64-efi --efi-directory=$MOUNT_DIR/boot --bootloader-id=GRUB
grub-mkconfig -o $MOUNT_DIR/boot/grub/grub.cfg

# Step 3: Restore installed packages from the packages list
echo "Restoring installed packages..."
if [ -f "$BACKUP_DIR/packages.txt" ]; then
    cat $BACKUP_DIR/packages.txt | pacman -S --needed - < /dev/stdin
else
    echo "No package list found. Skipping package restoration."
fi

# Step 4: Restore user configurations (home directory backup)
echo "Restoring user configurations..."
rsync -avh $BACKUP_DIR/home_user_backup/ /home/username/

# Step 5: Cleanup and finish
echo "Restoration complete! Please reboot the system."






Instructions for Using the Script:
Customize the Backup Directory:
Change the BACKUP_DIR variable to point to the actual backup location where you stored your backup files (e.g., /mnt/backup).
Add the Script to Your GitHub Repo:
Clone your GitHub repo where you want this script to reside.
Place the restore_backup.sh script in the appropriate directory in your repo.
Set Script Permissions:
After cloning the repo and navigating to the directory where the script is stored, make the script executable:
chmod +x restore_backup.sh
Run the Script:
After reinstalling Arch Linux and cloning your GitHub repo, run the script:
sudo ./restore_backup.sh
This will restore your backup files, including system files, bootloader, installed packages, and user configurations.
Notes:
The script assumes you are using GRUB for boot management. If you're using another bootloader (like systemd-boot), you'll need to adjust the bootloader restoration part accordingly.
Make sure to replace /home/username/ with the correct username for your home directory restoration. You can also automate this by dynamically identifying the user if needed.
The script assumes the backup contains the necessary files (like packages.txt for the installed package list and home_user_backup for user configurations).
