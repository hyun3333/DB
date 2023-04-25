
/*
���ν����� guguProc
�������� ���޹޾� �ش� �ܼ��� ����ϴ� procedure�� �����ϼ���.
*/
DROP PROCEDURE guguProc;
CREATE PROCEDURE guguProc
    (p_dan IN NUMBER)
IS -- �����

BEGIN -- �����
        FOR i IN 2..9
            LOOP
            dbms_output.put_line(i || ' �� ���');
                FOR j IN 1..9
                LOOP
                dbms_output.put_line(i || 'x' || j || '=' || i*j);
            END LOOP;
        END LOOP;
END;

EXEC guguProc;

/*
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/
ALTER TABLE depts ADD CONSTRAINT depts_pk PRIMARY KEY(department_id);

CREATE OR REPLACE PROCEDURE depts_proc
    (
     p_depts_id IN depts.department_id%TYPE,
     p_depts_name IN depts.department_name%TYPE,
     p_depts_flag IN VARCHAR2
    )
IS
    v_cnt NUMBER := 0;
BEGIN

    SELECT COUNT(*)
    INTO v_cnt
    FROM depts
    WHERE department_id = p_depts_id;

    IF p_depts_flag = 'I' THEN
        INSERT INTO depts (department_id, department_name)
        VALUES(p_depts_id, p_depts_name);
    ELSIF p_depts_flag = 'U' THEN
        UPDATE depts 
        SET department_id = p_depts_id
        WHERE  department_name = p_depts_name;
    ELSIF p_depts_flag = 'D' THEN
        IF v_cnt = 0 THEN
            dbms_output.put_line('�����ϰ��� �ϴ� �μ��� �������� �ʽ��ϴ�.');
            RETURN;
        END IF;
        DELETE FROM depts
        WHERE department_id = p_depts_id;
    ELSE
        dbms_output.put_line('�ش� flag�� ���� ������ �غ���� �ʾҽ��ϴ�');
    END IF;
    COMMIT;
EXCEPTION WHEN OTHERS THEN
    dbms_output.put_line('���ܰ� �߻��߽��ϴ�.');
    dbms_output.put_line('ERROR MSG : ' || SQLERRM);
    ROLLBACK;
END;

EXEC depts_proc(27348146, '������', 'D');

SELECT * FROM depts;

/*
employee_id�� �Է¹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/

CREATE OR REPLACE PROCEDURE emp_hire_proc (
    p_employee_id IN employees.employee_id%TYPE,
    p_year OUT NUMBER
)
IS
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT
        hire_date
    INTO v_hire_date
    FROM employees
    WHERE employee_id = p_employee_id;
    
    p_year := TRUNC((sysdate - v_hire_date) / 365);
    
EXCEPTION WHEN OTHERS THEN
    dbms_output.put_line(p_employee_id || '��(��) ���� ������ �Դϴ�.');

END;

DECLARE
    v_year NUMBER;
BEGIN
    emp_hire_proc(135,v_year);
    dbms_output.put_line(v_year);
END;

/*
���ν����� - new_emp_proc
employees ���̺��� ���� ���̺� emps�� �����մϴ�.
employee_id, last_name, email, hire_date, job_id�� �Է¹޾�
�����ϸ� �̸�, �̸���, �Ի���, ������ update, 
���ٸ� insert�ϴ� merge���� �ۼ��ϼ���

������ �� Ÿ�� ���̺� -> emps
���ս�ų ������ -> ���ν����� ���޹��� employee_id�� dual�� select ������ ��.
*/

CREATE OR REPLACE PROCEDURE new_emp_proc
    (
     p_employee_id IN employees.employee_id%TYPE,
     p_last_name IN employees.last_name%TYPE,
     P_email IN employees.email%TYPE,
     p_hire_date IN employees.hire_date%TYPE,
     p_job_id IN employees.job_id%TYPE
    )
IS

BEGIN
    MERGE INTO emps a
    USING (SELECT p_employee_id AS employee_id FROM dual) b
    ON (a.employee_id = b.employee_id)
    WHEN MATCHED THEN
        UPDATE SET
            a.last_name = p_last_name,
            a.email = p_email,
            a.hire_date = p_hire_date,
            a.job_id = p_job_id
    WHEN NOT MATCHED THEN
        INSERT (a.employee_id, a.last_name, a.email, a.hire_date, a.job_id)
        VALUES (p_employee_id, p_last_name, p_email, p_hire_date, p_job_id);
END;

EXEC new_emp_proc(100, 'park', 'park4321', '2023-04-24', 'test2');

SELECT * FROM emps;
