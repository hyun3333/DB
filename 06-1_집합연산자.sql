
-- ���� ������
-- UNION(������ �ߺ�x) UNION ALL(������ �ߺ� o) INTERSECT(������) MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION(������ �ߺ�x)
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- UNION ALL(������ �ߺ� o)
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-- INTERSECT(������)
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




