#!/bin/bash


amount_efivars=$(ls -la /sys/firmware/efi/efivars | wc -l)
if (($amount_efivars < 4)); then
  echo "No EFI variables set!"
  echo "Please boot this usb medium with UEFI. This may be available as a second option in your boot selection menu."
  exit 0
fi


country=$(curl -4 ifconfig.co/country-iso 2>/dev/null)
country_codes=$(reflector --list-countries | awk '{if (NR>2) {print $(NF-1)}}')

# querying user for country code
echo ""
read -p "Is country code '$country' correct (Y/n)? " answer
case $answer in
n|N|no|No|NO)
  valid=0
  while (($valid == 0)); do
    read -p "Enter your country code: " country 
    case $country in
      ?)
      echo -e "\n"$country_codes
      continue
      ;;
    esac
    valid=$(echo "$country_codes" | grep -i $country | wc -w)
    if (($valid == 0)); then
      echo "$country is not a valid code. Sry, try again, you may enter ? to get the available country codes"
    fi
  done
esac

# making pacman faster: querying best mirrorlist and enabling parallel download
echo -e "\n-- Enabling network time synchronization"
#Ctimedatectl set-ntp true
echo -e "-- Setting up mirros for optimal download"
cp  /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
#Creflector -a 48 -c $country -l 20 --sort rate --save /etc/pacman.d/mirrorlist
echo "-- Enabling parallel pacman downloads for install"
#Csed -i 's/^#Para/Para/' /etc/pacman.conf

# make sure /mnt exists and nothing is mounted
mkdir /mnt &>/dev/null
umount -R /mnt &>/dev/null
