/*Select CITY which ends in vowels*/

SELECT DISTINCT CITY 
FROM STATION 
WHERE LOWER(RIGHT(CITY,1)) IN ('a','i','e','o','u');


\*Alternate:
SUBSTR(string FROM start FOR length)*\

SELECT DISTINCT CITY 
FROM STATION 
WHERE LOWER(SUBSTR(CITY,LENGTH(CITY),1)) IN ('a','i','e','o','u');
