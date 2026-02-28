Duplicate Emails
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

Delete Duplicate Emails
DELETE p1
FROM Person p1
INNER JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

Nth Highest Salary
SELECT DISTINCT salary
FROM Employee e1
WHERE N = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);

Rank Scores
SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;

Department Highest Salary
SELECT D.name Department,
       E.name Employee,
       E.salary Salary
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) rank
    FROM Employee
) E
JOIN Department D
    ON E.departmentId = D.id
WHERE rank = 1;