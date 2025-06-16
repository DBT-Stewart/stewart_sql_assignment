CREATE TABLE dept_tbl (
    id_deptname VARCHAR(50),
    emp_name VARCHAR(50),
    salary INT
);

INSERT INTO dept_tbl (id_deptname, emp_name, salary)
VALUES 
('1111-MATH', 'RAHUL', 10000),
('1111-MATH', 'RAKESH', 20000),
('2222-SCIENCE', 'AKASH', 10000),
('222-SCIENCE', 'ANDREW', 10000),
('22-CHEM', 'ANKIT', 25000),
('3333-CHEM', 'SONIKA', 12000),
('4444-BIO', 'HITESH', 2300),
('44-BIO', 'AKSHAY', 10000);

select * from dept_tbl;

select 
RIGHT(id_deptname, LEN(id_deptname) - CHARINDEX('-', id_deptname)) as deptname,
sum(salary)
from dept_tbl
group by right(id_deptname, LEN(id_deptname) - CHARINDEX('-', id_deptname))
order by deptname;