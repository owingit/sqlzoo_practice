/* 
 * Section 3. Select from Nobel
 * https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
 */
 
 /* #1 
 * Problem: Show the Nobel prizes for 1950.
 */
 
 SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;
 
/* #2
 * Problem: Show who won the 1962 prize for Literature.
 */
 
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';
   
/* #3
 * Problem: Show Albert Einstein's prize information
 */
 
 SELECT yr, subject
  FROM nobel
 WHERE winner like 'Albert Einstein';
 
 /* #4
 * Problem: Give the name of the 'Peace' winners since the year 2000, including 2000.
 */
 
 SELECT winner
   FROM nobel
  WHERE subject = 'Peace'
    AND yr >= 2000;
    
/* #5
 * Problem: Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
 */
 
SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature'
   AND yr >= 1980
   AND yr <= 1989;
       
/* #6
 * Problem: Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama
 */
 
 SELECT * 
   FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');
                  
/* #7
 * Problem: Show the winners with first name John
 */
               
SELECT winner 
  FROM nobel 
 WHERE winner like 'John %';             

/* #8
 * Problem: Show 1980 Physics and 1984 Chemistry prizes
 */
 
 SELECT yr,subject,winner 
   FROM nobel
  WHERE (yr = 1980 and subject = 'Physics') 
     OR (yr = 1984 and subject = 'Chemistry');
     
/* #9
 * Problem: Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
 */
 
 SELECT yr, subject, winner 
   FROM nobel
  WHERE yr = 1980 
    AND subject NOT IN ('Chemistry', 'Medicine');
      
/* #10
 * Problem: Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
 */   
 
SELECT yr, subject, winner 
  FROM nobel
 WHERE (subject = 'Medicine' and yr < 1910)
    OR (subject = 'Literature' and yr >= 2004);

/* #11
 * Problem: Find all details of the prize won by PETER GRÜNBERG
 */
 
 SELECT * 
   FROM nobel
  WHERE winner like 'Peter Gr%nberg;;
  
 /* #12
 * Problem: Find all details of the prize won by EUGENE O'NEILL
 */ 
 
 SELECT * 
   FROM nobel 
  WHERE winner like 'Eugene O''Neill';
  
/* #13
 * Problem: List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
 */ 
 
SELECT winner, yr, subject 
  FROM nobel 
 WHERE winner like 'Sir %' 
 ORDER BY yr desc, winner;
 
 /* #14
 * Problem: Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
 */ 
 
 SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;
 
 
 
