#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

# echo -e "\nTotal number of goals in all games from winning teams:"
# echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

# echo -e "\nTotal number of goals in all games from both teams combined:"
# echo "$($PSQL "select sum(winner_goals) + sum(opponent_goals) from games;")"

# echo -e "\nAverage number of goals in all games from the winning teams:"
# echo "$($PSQL "select avg(winner_goals) from games;")"

# echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
# echo "$($PSQL "select round(avg(winner_goals), 2) from games;")"

# echo -e "\nAverage number of goals in all games from both teams:"
# echo "$($PSQL "select (avg(winner_goals)+avg(opponent_goals)) from games;")"

# echo -e "\nMost goals scored in a single game by one team:"
# echo "$($PSQL "select greatest(max(winner_goals), max(opponent_goals)) from games;")"

# echo -e "\nNumber of games where the winning team scored more than two goals:"
# echo "$($PSQL "select count(*) from games where winner_goals > 2;")"

# echo -e "\nWinner of the 2018 tournament team name:"
# echo "$($PSQL "select name from teams where team_id=(select winner_id from games where year=2018 and round='Final');")"

# echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
# echo "$($PSQL "select name from teams
# where team_id in (
# select distinct(winner_id) from games where year=2014 and round='Eighth-Final'
# union
# select distinct(opponent_id) from games where year=2014 and round='Eighth-Final')
# order by name asc;")"

# echo -e "\nList of unique winning team names in the whole data set:"
# echo "$($PSQL "select name from teams where team_id in (select distinct(winner_id) from games) order by name asc")

# echo -e "\nYear and team name of all the champions:"
# echo "$($PSQL "select g.year, t.name from games as g left join teams as t on(g.winner_id=t.team_id) where g.round='Final';")"

# echo -e "\nList of teams that start with 'Co':"
# echo "$($PSQL "select name from teams where name like 'Co%';")

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games ")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games INNER JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 ORDER BY winner_goals DESC LIMIT 1")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM teams LEFT JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year = 2014 AND round = 'Eighth-Final' ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams INNER JOIN games ON teams.team_id = games.winner_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM games INNER JOIN teams ON games.winner_id = teams.team_id WHERE round = 'Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"