#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.


echo "Total number of goals in all games from winning teams:"
$PSQL "SELECT SUM(winner_goals) FROM games"

echo "Total number of goals in all games from both teams combined:"
$PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games"

echo "Average number of goals in all games from the winning teams:"
$PSQL "SELECT AVG(winner_goals) FROM games"

echo "Average number of goals in all games from the winning teams rounded to two decimal places:"
$PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games"

echo "Average number of goals in all games from both teams:"
$PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games"

echo "Most goals scored in a single game by one team:"
$PSQL "SELECT MAX(winner_goals) FROM games"

echo "Number of games where the winning team scored more than two goals:"
$PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2"

echo "Winner of the 2018 tournament team name:"
$PSQL "SELECT name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE year = 2018 AND round='Final'"

echo "List of teams who played in the 2014 'Eighth-Final' round:"
$PSQL "SELECT DISTINCT name FROM teams JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name"

echo "List of unique winning team names in the whole data set:"
$PSQL "SELECT DISTINCT name FROM teams JOIN games ON teams.team_id = games.winner_id ORDER BY name"

echo "Year and team name of all the champions:"
$PSQL "SELECT year, name FROM games JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY year"

echo "List of teams that start with 'Co':"
$PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'"
