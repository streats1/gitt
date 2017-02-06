  SELECT d.DEPARTMENT_ID,
         d.department_name,
         e.hire_Date,
         e.first_name,
         e.last_name,
         e.salary
    FROM employees e, departments d
   WHERE     e.DEPARTMENT_ID = d.DEPARTMENT_ID
         AND (department_name, hire_date) IN
                (  SELECT department_name, MAX (hire_date)
                     FROM employees
                 GROUP BY department_id)
ORDER BY salary DESC;   
 
--2   



  SELECT employee_id, last_name, salary
    FROM employees e,
         (  SELECT department_id, AVG (salary) AS v
              FROM employees
          GROUP BY department_id) d
   WHERE e.DEPARTMENT_ID = d.department_id AND salary > v
ORDER BY salary DESC;


-- 3

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       j.job_title,
       e.salary
  FROM employees e,
       jobs j,
       (  SELECT department_id, AVG (salary)
            FROM employees
           WHERE department_id = 90
        GROUP BY department_id) d
 WHERE e.JOB_ID = j.JOB_ID AND e.department_id = d.department_id;

 --4

SELECT *
  FROM (SELECT d.department_name, s.max_salary
          FROM (  SELECT department_id, AVG (salary) AS max_salary
                    FROM employees
                GROUP BY department_id
                ORDER BY max_salary DESC) s,
               employees e,
               departments d
         WHERE     e.DEPARTMENT_ID = d.DEPARTMENT_ID
               AND e.DEPARTMENT_ID = s.DEPARTMENT_ID)
 WHERE ROWNUM = 1;

--5
select * from 
  (SELECT l.CITY, AVG (salary) as max_salary
    FROM employees e,
         departments d,
         locations l,
         countries c,
         regions r
   WHERE     e.DEPARTMENT_ID = d.DEPARTMENT_ID
         AND l.LOCATION_ID = d.LOCATION_ID
         AND l.COUNTRY_ID = c.COUNTRY_ID
         AND c.REGION_ID = r.REGION_ID
GROUP BY city
order by max_salary desc)
where rownum = 1;


--6
select * from (
select j.JOB_TITLE,avg(salary) from employees e , jobs j
where e.JOB_ID = j.JOB_ID
group by j.JOB_TITLE
order by avg(salary) desc)
where rownum = 1;