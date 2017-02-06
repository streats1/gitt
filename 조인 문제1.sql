--1번문제

select emp.EMPLOYEE_ID,emp.first_name
,dep.DEPARTMENT_NAME,emp1.FIRST_NAME 
from employees emp,departments dep,employees emp1
where emp.DEPARTMENT_ID = dep.DEPARTMENT_ID 
and emp1.EMPLOYEE_ID = emp.manager_ID;

--2번문제
select regi.REGION_NAME as rn,coun.COUNTRY_NAME as cn
 from regions regi,countries coun
where regi.REGION_ID = coun.REGION_ID
order by rn,cn desc;

--3 문제
select dep.DEPARTMENT_ID,
dep.DEPARTMENT_NAME,
emp.FIRST_NAME,
lo.CITY,
coun.COUNTRY_NAME,
regi.REGION_NAME
from departments dep,
employees emp,
locations lo,
countries coun,
regions regi

where dep.manager_id = emp.manager_id
and dep.LOCATION_ID = lo.location_ID
and lo.COUNTRY_ID = coun.country_id
and coun.region_id = regi.REGION_ID;

--4번문제
select j.JOB_TITLE,emp.EMPLOYEE_ID,
(emp.FIRST_NAME||emp.LAST_NAME)as "name" from
 job_history jh,
 jobs j ,
 employees emp
where jh.EMPLOYEE_ID = emp.EMPLOYEE_ID
and jh.JOB_ID = j.JOB_ID
and j.job_title = 'Public Accountant' ;
--having j.JOB_TITLE ='Public Account';

--5번문제
select e.EMPLOYEE_ID,
e.FIRST_NAME,
e.LAST_NAME,
d.DEPARTMENT_NAME 
from employees e , departments d
where e.department_id = d.DEPARTMENT_ID
order by e.LAST_NAME asc;

--6번문제.
select e.EMPLOYEE_ID,e.LAST_NAME,
e.HIRE_DATE,d.last_name,d.HIRE_DATE
from employees e, employees d
where e.employee_id = d.manager_id
and e.HIRE_DATE > d.HIRE_DATE
 ;
