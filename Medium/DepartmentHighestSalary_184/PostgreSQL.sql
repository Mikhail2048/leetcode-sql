SELECT
    d.name as Department,
    src.name as Employee,
    src.salary as Salary
FROM Employee as src
INNER JOIN (
    SELECT
        departmentId as dId,
        MAX(salary) as max_sal
    FROM employee
    GROUP BY departmentId
) as trgt ON trgt.dId = src.departmentId AND src.salary = trgt.max_sal
INNER JOIN Department d ON d.id = src.departmentId
