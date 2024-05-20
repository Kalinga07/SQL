/* Write your T-SQL query statement below */
SELECT coalesce(Emp_uni.unique_id,null)  as unique_id,emp.name as name FROM Employees emp LEFT JOIN employeeUNI emp_uni ON
emp.id=emp_uni.id