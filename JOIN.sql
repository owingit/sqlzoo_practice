/* 
 * Section 6. JOIN operations
 * https://sqlzoo.net/wiki/The_JOIN_operation
 */
 
--#1
/*
 * Problem: Show matchid and player name for all goals scored by Germany.
 */

SELECT matchid, player 
  FROM goal 
 WHERE teamid LIKE 'GER';
 
--#2
 /*
  * Problem: Show id, stadium, team1, team2 for just game 1012
  */
 
SELECT id, stadium, team1, team2
  FROM game
 WHERE id = 1012;
 
--#3
 /*
  * Show the player, teamid, stadium and mdate for every German goal.
  */
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (game.id = goal.matchid)
 WHERE teamid = 'GER';
 
--#4
 /*
  * Problem: Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
  */
  
SELECT team1, team2, player
  FROM game JOIN goal ON (game.id = goal.matchid)
 WHERE player LIKE 'Mario%';

--#5
 /*
  * Problem: Show player, teamid, coach, gtime for all goals scored in the first 10 minutes 
  */
  
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (goal.teamid = eteam.id)
 WHERE gtime<=10;
 
 --#6
 /*
  * Problem: List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
  */
  
SELECT mdate, teamname
  FROM game JOIN eteam ON (game.team1 = eteam.id)
 WHERE coach = 'Fernando Santos';
 
--#7
 /*
  * Problem: List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
  */
  
SELECT player
  FROM goal JOIN game ON (goal.matchid = game.id)
 WHERE stadium = 'National Stadium, Warsaw';
 
--#8 
 /*
  * Problem: Show the name of all players who scored a goal against Germany.
  */
  
SELECT DISTINCT player
  FROM game JOIN goal ON (goal.matchid = game.id) 
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';
 
 --#9
 /*
  * Problem: Show teamname and the total number of goals scored.
  */
  
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON (eteam.id = goal.teamid)
 GROUP BY teamname;
 
  --#10
 /*
  * Problem: Show the stadium and the number of goals scored in each stadium.
  */
 
 SELECT stadium, COUNT(*)
  FROM game JOIN goal ON (goal.matchid = game.id)
 GROUP BY stadium;
 
   --#11
 /*
  * Problem: For every match involving 'POL', show the matchid, date and the number of goals scored.
  */
  
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON (goal.matchid = game.id) 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid, mdate;
 
 
    --#12
 /*
  * Problem:  For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
  */

SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON (game.id = goal.matchid)
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid, mdate;

--#13
/*
 * Problem: List every match with the goals scored by each team as shown. Sort your result by mdate, matchid, team1 and team2.
 */
SELECT mdate, team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 
  FROM game LEFT JOIN goal ON (game.id = goal.matchid)
    GROUP BY mdate, team1, team2
    ORDER BY mdate, matchid, team1, team2
