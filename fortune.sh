#!/bin/bash
# Program to tell a persons fortune
echo -e "\n~~ Fortune Teller ~~\n"
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))
# echo -e "\n${RESPONSES[$N]}"
GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    echo -e "Ask a yes or no question:\n"
  else
    echo -e "Try again. Make sure it ends with a question mark:\n"
  fi

  read QUESTION
}
GET_FORTUNE
until [[ $QUESTION =~ \?$ ]]
do 
  GET_FORTUNE again
done

echo -e "\n${RESPONSES[$N]}"
