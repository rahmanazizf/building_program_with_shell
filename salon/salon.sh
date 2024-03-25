#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


MAIN_MENU() {

  if [[ -z $1 ]];then
    echo -e "\n~~~~~ MY SALON ~~~~~\n"
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo "$1"
  fi

  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_TO_PICK
  if [[ ! $SERVICE_ID_TO_PICK =~ ^[0-9]+$ ]]; then
    MAIN_MENU "That's not a valid number."
  else
    SERVICE_ID_AVAIL=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_TO_PICK")
    if [[ -z $SERVICE_ID_AVAIL ]]; then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      echo -e "\nWhat's your phone number?"
      read PHONE_NUMBER

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = $'PHONE_NUMBER'")
      
      if [[ -z $CUSTOMER_ID ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$PHONE_NUMBER', '$CUSTOMER_NAME')")

        CUSTOMER_NAME=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")  
      fi

      echo -e "\nWhat time would you like your cut, Fabio?"
      read TIME

      if [[ ! $TIME =~ ^[0-9]+(:[0-9]+)?(am|pm)?$ ]];then
        MAIN_MENU "That's not a valid time."
      else
        MAKE_APPOINTMENT=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_TO_PICK, $CUSTOMER_ID, '$TIME')")

        if [[ $MAKE_APPOINTMENT != 'INSERT 0 1' ]];
          MAIN_MENU "Failed to make an appointment."
        else
          MAIN_MENU "\nI have put you down for a $SERVICE_ID_AVAIL at $TIME, $CUSTOMER_NAME."
        fi
      fi
    fi
  fi
}


MAIN_MENU