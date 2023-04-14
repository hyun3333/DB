
-- 집합 연산자
-- UNION(합집합 중복x) UNION ALL(합집합 중복 o) INTERSECT(교집합) MINUS(차집합)
-- 위 아래 column 개수가 데이터 타입이 정확히 일치해야 합니다.

-- UNION(합집합 중복x)
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL(합집합 중복 o)
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT(교집합)
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';

SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';




