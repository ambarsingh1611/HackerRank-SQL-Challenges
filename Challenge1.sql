/*
Julia asked her students to create some coding challenges. Write a query to print the 
hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the 
maximum number of challenges created, then exclude those students from the result.
*/



SELECT 
    h.hacker_id, h.name, COUNT(c.challenge_id) AS challenges_created
FROM
    Hackers h
JOIN
    Challenges c ON c.hacker_id = h.hacker_id
    
GROUP BY h.hacker_id, h.name

HAVING 
    challenges_created = 
            (SELECT MAX(maxcnt.cnt) AS maxchallenge
            FROM
            (SELECT COUNT(hacker_id) AS cnt
             FROM Challenges
             GROUP BY hacker_id) maxcnt)
    
    OR

    challenges_created IN 
    (SELECT temp.cnt
     FROM
        (SELECT COUNT(hacker_id) AS cnt
        FROM Challenges
        GROUP BY hacker_id) temp
    GROUP BY temp.cnt
    HAVING COUNT(temp.cnt) = 1)

ORDER BY challenges_created DESC, hacker_id;
