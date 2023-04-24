
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자 (출력문 9개를 복사해서 쓰세요)
DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

DECLARE
    A1 NUMBER := 3*1;
    A2 NUMBER := 3*2;
    A3 NUMBER := 3*3;
    A4 NUMBER := 3*4;
    A5 NUMBER := 3*5;
    A6 NUMBER := 3*6;
    A7 NUMBER := 3*7;
    A8 NUMBER := 3*8;
    A9 NUMBER := 3*9;
BEGIN
    dbms_output.put_line('3x1 = ' || TO_CHAR(A1));
    dbms_output.put_line('3x2 = ' || TO_CHAR(A2));
    dbms_output.put_line('3x3 = ' || TO_CHAR(A3));
    dbms_output.put_line('3x4 = ' || TO_CHAR(A4));
    dbms_output.put_line('3x5 = ' || TO_CHAR(A5));
    dbms_output.put_line('3x6 = ' || TO_CHAR(A6));
    dbms_output.put_line('3x7 = ' || TO_CHAR(A7));
    dbms_output.put_line('3x8 = ' || TO_CHAR(A8));
    dbms_output.put_line('3x9 = ' || TO_CHAR(A9));
END;


-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명 블록을 만들어 보자. (변수에 담아서 출력하세요).
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
        first_name,
        email
    INTO
        v_emp_name, v_emp_email
    FROM employees
    WHERE employee_id = 201;
    
    dbms_output.put_line(v_emp_name || ' - ' || v_emp_email);
END;


-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps테이블에 
-- employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
-- SELECT절 이후 INSERT문 사용이 가능합니다.
/*
<사원명> : steven
<이메일> : stevenjobs
<입사일자> : 오늘 날짜
<JOB_ID> : CEO
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '개발자', 1700);
*/

DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT
        MAX(employee_id)
    INTO
        v_emp_id
    FROM employees;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (v_emp_id + 1,'steven', 'stevenjobs', sysdate, 'CEO');
    
END;

SELECT
    *
FROM emps;

