if [ "$1" == "click" ]; then
  # Launch ncdu in the terminal
     kitty -e ncdu /
else
  # Show disk usage
     df -h / | awk 'NR==2 {print " /: "$5}'
fi
  
