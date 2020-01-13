/*Using regexp to identify a pattern*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP "^[aeiou].*";
