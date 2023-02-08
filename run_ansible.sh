#!/bin/bash

HEADER="Run Ansible Playbook"
TLINES=$(tput lines)
TCOLS=$(expr $(tput cols) \* 4 / 5)

# get playbook
FILE=$(dialog --backtitle "$HEADER" --stdout --clear --title "Select Playbook" --fselect playbooks/ $(expr $TLINES - 15) $TCOLS)

if [ ! -f "$FILE" ]; then
  dialog --backtitle "$HEADER" --clear --title "Error" --msgbox "The file $FILE was not found" 5 $TCOLS
  clear
  exit 1
fi

# get hosts
HOST_LIST=$(yq -r hosts.yml -ojson | jq ".all.hosts|keys[]" | tr -d '"')
HOST_NUM=$(echo "$HOST_LIST" | wc -l)
HOST_STR=$(echo "$HOST_LIST" | awk '{print $0" off"}' | nl -w1 -s" " | tr "\n" " ")
HOSTS=$(dialog --backtitle "$HEADER" --stdout --clear --title "Select Hosts" --checklist "Use space to select" $(expr $TLINES - 10) $TCOLS $HOST_NUM $HOST_STR) # the xagrs trims spaces

CHECK=$(echo $HOSTS | tr -d "\n")
if [ -z "$CHECK" ]; then
  dialog --backtitle "$HEADER" --clear --title "Error" --msgbox "No hosts selected, use space to select" 5 $TCOLS
  clear
  exit 1
fi

HOST_CSV=$(echo $HOSTS | tr " " "\n" | (while IFS=" " read -r line; do echo -n "$HOST_LIST" | sed -n "${line}p"; done;) | tr "\n" ",")

# override
#HOST_CSV="all"

dialog --backtitle "$HEADER" --stdout --clear --title "Ask for SSH password?" --yesno "Yes: enter SSH password\nNo: local or key access available" 10 $TCOLS
RETVAL=$?

if [ $RETVAL -eq 0 ]; then
  ASK_PASS="-K --ask-pass"
fi

clear
ansible-playbook $FILE -i hosts.yml --limit "$HOST_CSV" $ASK_PASS $@