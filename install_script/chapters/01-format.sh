#!/bin/bash

check_partition_choice () {
  case $1 in
    ?)
    lsblk
    return 0
    ;;
  esac
  valid=$(fdisk -l 2>/dev/null | grep -i $1 | wc -l)
  if (($valid == 0)); then
    echo "$1 not found!"
  fi
  return $valid
}
to_bool () {
  case $1 in
    y|Y|yes|Yes|YES)
      return 1
      ;;
    n|N|no|No|NO)
      return 0
      ;;
  esac
  return 1
}
to_symbol () {
  if (( $1 == 0 )); then return "N" 
  elif (( $1 == 1 )); then return "Y"
  else return "?"
  fi
}

# PARTITION SELECTION
echo -e ""
echo "--------------------------------------------------------------"
echo "-                        CHAPTER 01                          -"
echo "-   Select/Format partitions (type ? to list partitions)     -"
echo "--------------------------------------------------------------"
valid=0

# boot
while (($valid == 0)); do
  read -p "Boot: " boot_partition
  if [ -n "$boot_partition" ]; then
    check_partition_choice $boot_partition
    valid=$?
  fi
done

boot_part_post=$(echo $boot_partition | awk -F"/" '{print $NF}')
boot_fs=$(lsblk -f | grep $boot_part_post | awk '{print $2}')
format_boot_partition=0
if [ "$boot_fs" != "vfat" ]; then
  # TODO be able to re-enter a different partition
  read -p "Boot partitions filesystem is not 'vfat' but '$boot_fs', hence formatting is necessary! Continue [Y/n]? " answer
  case $answer in
    n|N|No|NO)
      exit 0
      ;;
  esac
  format_boot_partition=1
fi

# only ask for formatting permission if we havn't already agreed to formatting, 'cause vfat filesystem necessity
if (( $format_boot_partition != 1 )); then
  mount $boot_partition /mnt
  if [ -d "/mnt/EFI/Microsoft" ]; then
    echo "Found Microsoft Windows on boot partition '$boot_partition'"
    echo -e "\t[0] Install alongside windows"
    echo -e "\t[1] Still format boot partition (this will erase all data on '$boot_partition')"
    read -p "Choose [0-1]: " format_boot_partition
  elif (( $(ls /mnt | wc -l) > 0 )); then
      echo "Boot partition is not empty"
      echo -e "\t[0] Don't format boot partition, it's already FAT32"
      echo -e "\t[1] Format boot partition (this will erase all data on '$boot_partition')"
      read -p "Choose [0-1]: " format_boot_partition
  else
    echo "Boot partition seems to be empty"
    read -p "Format boot partition [Y/n]? " answer
    to_bool $answer
    format_boot_partition=$(($?))
  fi
  if (( $format_boot_partition == 1 )); then
    echo "Partition '${boot_partition}' will be formatted to FAT32"
  fi
  umount -R /mnt
fi
final_boot_fs="vfat"

# sys
echo ""
valid=0
while (( $valid == 0 )); do
  read -p "System: " sys_partition
  if [ -n "$sys_partition" ]; then
    # check if this partition was already chosen
    if [[ $sys_partition == $boot_partition ]]; then
      echo "Partition '${boot_partition}' already chosen as boot partition!"
    else
      check_partition_choice $sys_partition
      valid=$?
    fi
  fi
done
sys_part_post=$(echo $sys_partition | awk -F"/" '{print $NF}')
sys_fs=$(lsblk -f | grep $sys_part_post | awk '{print $2}')
echo "Current filesystem of '${sys_partition}' is ${sys_fs}"
read -p "Format '$sys_partition' [Y/n]? " answer
to_bool $answer
format_sys_partition=$(($?))


# home
echo ""
use_home_partition=0
read -p "Do you want to have a seperate home partition [Y/n]? " answer
to_bool $answer
use_home_partition=$(($?))
format_home_partition=0
if (( $use_home_partition == 1 )) ; then
  valid=0
  while (($valid == 0)); do
    read -p "Home: " home_partition
    if [ -n "$home_partition" ]; then
      if [[ $home_partition == $sys_partition ]]; then
        echo "Partition '${home_partition}' already chosen as system partition!"
      elif [[ $home_partition == $boot_partition ]]; then
        echo "Partition '${home_partition}' already chosen as boot partition!"
      else
        check_partition_choice $home_partition
        valid=$?
      fi
    fi
  done
  home_part_post=$(echo $sys_partition | awk -F"/" '{print $NF}')
  home_fs=$(lsblk -f | grep $sys_part_post | awk '{print $2}')
  echo "Current filesystem of '${home_partition}' is ${home_fs}"
  read -p "Format '$home_partition' [Y/n]? " answer
  to_bool $answer
  format_home_partition=$(($?))
fi

# filesystem choice
final_home_fs="$home_fs"
final_sys_fs="$sys_fs"
if (( $format_home_partition > 0 )) || (( $format_sys_partition > 0 )); then
  echo -e "\nChoose filesystem:"
  echo -e "\t[0] EXT4 (default)"
  echo -e "\t[1] BTRFS (beta state)"
  echo -e "\t[2] Format with current filesystem"
  valid=0
  while (( $valid == 0 )); do
    valid=1
    answer=0
    read -p "Choose: " answer
    if [ $answer -eq "0" ]; then
      if (( $format_home_partition > 0 )); then
        final_home_fs="ext4"
      fi
      if (( $format_sys_partition > 0 )); then
        final_sys_fs="ext4"
      fi
    elif [ $answer -eq "1" ]; then
      if (( $format_home_partition > 0 )); then
        final_home_fs="btrfs"
      fi
      if (( $format_sys_partition > 0 )); then
        final_sys_fs="btrfs"
      fi
    fi

    # if we don't format both partition they might have a different filesystem, this may not be a good state
    # TODO maybe more verbose message? like: also recognize which partition for format and which not was chosen etc. ?
    if (( $use_home_partition == 1 )); then
      if [[ $final_sys_fs != $final_home_fs ]]; then
        echo "WARNING: The final filesystems of your home (${final_home_fs}) and system (${final_sys_fs}) partition would be different. Please use the same filesystem for your home and system partition. Choose again."
        valid=0
      fi
    fi
  done
fi


# summary
format_boot_partition_sym="N"
format_home_partition_sym="N"
format_sys_partition_sym="N"
if (( $format_boot_partition == 1 )); then
  format_boot_partition_sym="Y"
fi
if (( $format_home_partition == 1 )); then
  format_home_partition_sym="Y"
fi
if (( $format_sys_partition == 1 )); then
  format_sys_partition_sym="Y"
fi
echo ""
echo "--------------------------------------------------------------"
echo "-                   FORMATTING SUMMARY                       -"
echo "--------------------------------------------------------------"
top_row="Purpose|Partition|Current FS|Format?|Final FS"
boot_row="Boot|$boot_partition|$boot_fs|$format_boot_partition_sym|$final_boot_fs"
sys_row="System|$sys_partition|$sys_fs|$format_sys_partition_sym|$final_sys_fs"
if (( $use_home_partition == 1 )); then
  home_row="Home|$home_partition|$home_fs|$format_home_partition_sym|$final_home_fs"
else
  home_row="Home|Same as system "
fi
echo -e "$top_row\n$boot_row\n$sys_row\n$home_row" | column -t -s "|"

valid=0
echo -e "Choose action:"
echo -e "    [0] Perform action according to this summary"
echo -e "    [1] Skip (get to next chapter without doing anything)"
echo -e "    [2] Back (start this chapter again)"
while (( $valid == 0 )); do
  read -p "Choose? " answer
  case $answer in
    0|1)
      valid=1
      ;;
    *)
      valid=0
      echo "Not yet implemented"
      ;;
  esac
done


case $answer in
  0)
    # boot formatting
    if (( $format_boot_partition == 1 )); then
      echo "-- Formatting boot partition '$boot_partition' (vfat)"
      #Cmkfs.fat -F32 $boot_partition
    else
      echo "-- Skipping formatting of boot partition"
    fi
    # sys formatting
    if (( $format_sys_partition == 1 )); then
      if [ $sys_partition_fs -eq "btrfs" ]; then
        echo "-- Formatting system partition '$sys_partition' (btrfs)"
        #Cmkfs.btrfs $sys_partition &>/dev/null
        echo "-- Creating btrfs root subvolume '@' on '$sys_partition'"
        #Cmount $sys_partition /mnt &>/dev/null
        pushd /mnt &>/dev/null
        #Cbtrfs subvolume create @ &>/dev/null
        popd &>/dev/null
        #Cumount /mnt &>/dev/null
      elif [ $sys_partition_fs -eq "ext4" ]; then
        echo "-- Formatting '$sys_partition' (ext4)"
        #Cmkfs.ext4 -L ROOT $sys_partition
      fi
    else
      echo "-- Skipping formatting of system partition" 
    fi
    ;;
  1)
    #TODO do i need to do smth here?
    ;;
  2)
    #TODO soooo, how do i do this best / quickest?
    ;;
esac


