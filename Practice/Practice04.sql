#문제1.
#평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.
#(56건)

# 1. 평균 월급 구하기
select avg(salary)
from employees;
# 2. 평균월급보다 적은사람 구하기
select count(first_name)
from employees
where salary<6461.831776;
# 3. 합치기
select count(first_name)
from employees
where salary <(select avg(salary)
			   from employees);
               
#문제2.
#평균월급 이상, 최대월급 이하의 월급을 받는 사원의
#직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차
#순으로 정렬하여 출력하세요
#(51건)

#1. 평균월급 이상, 최대월급 이하의 월급을 받는 사원을 구한다.
select avg(salary)
from employees;
select max(salary)
from employees;
select *
from employees
where salary between 6461.831776 and 24000;

# 2. 평균월급보다 높은 월급을 받는 사원을 구한다.

select  employee_id 사번,
		first_name 이름,
        salary 월급,
        (select avg(salary)from employees) 평균월급,
        (select max(salary)from employees) 최대월급
from employees 
where salary >= (select avg(salary)from employees)
and salary <= (select max(salary) from employees)
order by salary asc;


#문제3.
#직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
#를 알아보려고 한다.
#도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
#(state_province), 나라아이디(country_id) 를 출력하세요

# 1. 스티븐 킹이 소속된 부서아이디 알아내기.
select  *
from employees
where first_name = 'Steven'
and last_name = 'King';

#steven의 부서 주소 알아내기

select  d.location_id,
		l.street_address,
        l.postal_code,
		l.city,
        l.state_province,
        l.country_id
from departments d, locations l, (select department_id
								  from employees
                                  where first_name = 'steven'
                                  and last_name = 'king') P
where d.department_id = p.department_id
and d.location_id = l.location_id;




#문제4.
#job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로
#출력하세요 -ANY연산자 사용
#(74건)

select *
from employees
where job_id = 'ST_MAN';

select  employee_id,
		first_name,
        salary
from employees
where salary < Any(select salary
				   from employees
				   where job_id = 'ST_MAN')
order by salary desc;


#문제5.
#각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급
#(salary) 부서번호(department_id)를 조회하세요
#단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다.
#조건절비교, 테이블조인 2가지 방법으로 작성하세요
#(11건)

#1. 부서별로 최고월급을 받는 사람 구하기
select  max(salary),
		department_id
from employees
group by department_id;

# 2. 부서번호, 최고월급 을 동시에 만족하는 직원을 구한다. (조건절 비교)
select employee_id,
		first_name,
        department_id,
        salary
from employees
where (department_id, salary) in (select department_id, max(salary)
								  from employees
                                  group by department_id)
order by salary desc;

# 2. 부서번호, 최고월급 을 동시에 만족하는 직원을 구한다. (테이블 조인)
select  e.department_id, 
		e.employee_id, 
        e.first_name, 
        e.salary
from employees e, ( select department_id, max(salary) salary
					from employees
                    group by department_id )s
where e.department_id = s.department_id
and e.salary = s.salary
order by salary desc;

#문제6.
#각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다.
#월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오
#(19건)

# 1. 업무별 월급의 총합 구하기
select  sum(salary),
		job_id
from employees
group by job_id;

# 2. 업무명과 월급총합 출력하기(조건절 비교)

select  e.salary,
		e.job_id,
        j.job_title
from employees e, jobs j, (select job_id, sum(salary) salary
						   from employees
                           group by job_id)s
where e.job_id = j.job_id
and e.salary = s.salary;                           




#문제7.
#자신의 부서 평균 월급보다 월급(salary)이 많은 직원의 직원번호(employee_id), 이름
#(first_name)과 월급(salary)을 조회하세요
#(38건)

# 1. 부서별 평균 월급 구하기
select  avg(salary),
		department_id
from employees
group by department_id;

# 2. 평균 월급보다 월급이 더 많은 직원 구하기
select  e.employee_id,
		e.first_name,
        e.salary
from employees e, (select avg(salary) salary, department_id
				  from employees
                  group by department_id)s
where e.salary > s.salary
and e.department_id = s.department_id;


#문제8.
#직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 월급, 입사일을 입사일 순서로 출력
#하세요

select  employee_id 사번,
		first_name 이름,
        salary 월급,
        hire_date 입사일
from employees
order by hire_date asc
limit 10, 5;




















