-- insert
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT�� ù��° ��� (��� �÷� �����͸� �� ���� ����)
INSERT INTO departments
VALUES (290, '������');

SELECT * FROM departments;
ROLLBACK;
; -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű����

-- INSERT�� �� ��° ��� (���� �÷��� �����ϰ� ����, NOT NULL Ȯ���ϼ���!)
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '������', 1700);

-- �纻 ���̺� ����
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1=2) �����ϸ� -> ���̺��� ������ �����ϰ� �����ʹ� ����x
CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 1);

SELECT * FROM managers;
DROP TABlE managers;

-- INSERT (��������)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

---------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;
/*
CTAS�� ����ϸ� ���� ������ NOT NULL ������ ������� �ʽ��ϴ�.
���������� ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� �ʴ� �͵���
DB�� ����Ǵ� ���� �����ϴ� �������� ����մϴ�.
*/


