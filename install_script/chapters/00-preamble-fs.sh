info_message() {
  echo "MAKE SURE THAT:"
  echo -e "\t- you have your desired partitions ready (formatting will be done here)"
  echo -e "\t- you have an internet connection (see iwctl for wlan)"
  echo -e "\nFor every chapter you will be asked questions on how to setup the os, but the actual action (like formatting) always happen after a summary of your given answers and your confirmation of these answers!"
  
  read -p "Ready to continue (Y/n)? " continue
  case $continue in
    n|N|no|No|NO)
      exit 0
  ;;
  esac
}
