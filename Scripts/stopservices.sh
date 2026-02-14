#!/bin/bash 


echo "killing processes with '$ SYSTEMCTL'!!!"

sleep 1

## SYSTEMCTL
sudo systemctl stop libvirtd-admin.socket;            
sudo systemctl stop libvirtd-ro.socket;
sudo systemctl stop libvirtd.service;
sudo systemctl stop libvirtd.socket;
sudo systemctl stop virtlockd-admin.socket;
sudo systemctl stop virtlockd.socket;
sudo systemctl stop virtlogd-admin.socket;
sudo systemctl stop virtlogd.socket;
sudo systemctl stop polkit-agent-helper.socket;                              
sudo systemctl stop polkitd.service;                
echo "Done, moving to next step!"
sleep 1

## PKILL
echo "killing processes with '$ PKILL'!!!"
sleep 1 
sudo pkill mako
sudo pkill watchdogd
sudo pkill swww-daemon
sudo pkill gnome-keyring-d
sudo pkill polkit-gnome-au
sudo pkill kitty
echo "Program Finished."

sudo pkill glycin-image-rs
sudo pkill glycin-svg
