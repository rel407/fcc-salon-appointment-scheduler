#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~ AYANNA'S SALON ~~~~\n\nWelcome to Ayanna's Salon, how can I help you?\n"

# Main Menu
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "1) hair cut\n2) hair coloring\n3) perm\n4) hair styling\n5) hair trim\n"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SERVICE="hair cut" CUSTOMER_MENU ;;
    2) SERVICE="hair coloring" CUSTOMER_MENU ;;
    3) SERVICE="perm" CUSTOMER_MENU ;;
    4) SERVICE="hair styling" CUSTOMER_MENU ;;
    5) SERVICE="hair trim" CUSTOMER_MENU ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

# Get customer info
CUSTOMER_MENU() {
  # Get customer's phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Retrieve customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # Collect customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # Add new customer into the 'customers' table
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  # Get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Get customer's appointment time
  echo -e "\nWhat time would you like your '$SERVICE', '$CUSTOMER_NAME'?"
  read SERVICE_TIME

  # Insert appointment into 'appointments' table
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

  # Final confirmation
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
