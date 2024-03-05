#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

TRUN_TEAMS=$($PSQL "TRUNCATE teams CASCADE;")
if [ "$TRUN_TEAMS" != 'TRUNCATE TABLE' ]; then
  echo $TRUN_TEAMS
  echo "Failed to delete teams table"
  exit 1
fi
TRUN_GAMES=$($PSQL "TRUNCATE games CASCADE;")
if [ "$TRUN_GAMES" != 'TRUNCATE TABLE' ]; then
  echo $TRUN_GAMES
  echo "Failed to delete games table"
  exit 1
fi
# Do not change code above this line. Use the PSQL variable above to query your database.
# INSERTING TEAM DATA
while IFS=, read YR RD WIN OPP WIN_GOALS OPP_GOALS
do
  if [ "$YR" = "year" ]; then
    continue
  fi
  # check if the team has been already in the database
  winner_team=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN';")
  opponent_team=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP';")

  if [ -z $winner_team ]; then
    insert_winner=$($PSQL "INSERT INTO teams(name) VALUES('$WIN');")
  fi
  if [ -z $opponent_team ]; then
    insert_opponnent=$($PSQL "INSERT INTO teams(name) VALUES('$OPP');")
  fi

  if [ "$insert_winner" = 'INSERT 0 1' ]; then
    echo "Team $WIN was inserted"
  fi
  if [ "$insert_opponent" = 'INSERT 0 1' ]; then
    echo "Team $OPP was inserted"
  fi

done < games.csv

while IFS=, read YR RD WIN OPP WIN_GOALS OPP_GOALS
do
  if [ "$YR" = 'year' ]; then
    continue
  fi

  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN';")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP';")

  insert_game=$($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($YR, $winner_id, $opponent_id, $WIN_GOALS, $OPP_GOALS, '$RD');")
  if [ '$insert_game' = 'INSERT 0 1' ]; then
    echo "Inserted $YR, $WIN, $OPP, $RD"
  fi
done < games.csv