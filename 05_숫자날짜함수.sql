
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정, 음수를 주는것도 가능
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (절대값)
SELECT ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지)
SELECT 10/4, MOD(10, 4)
FROM dual;

-- sysdate(날짜 함수 시간 정보 포함)
SELECT sysdate FROM dual;

-- systiemstamp(날짜 함수 시간 밀리초 정보 포함) 
SELECT systimestamp FROM dual;

-- 날짜도 연산이 가능합니다.
SELECT sysdate + 1 FROM dual;

SELECT first_name, sysdate - hire_date
FROM employees; -- 일수

SELECT first_name, hire_date,
(sysdate - hire_date) / 7 AS week
FROM employees; -- 주수

SELECT first_name, hire_date,
(sysdate - hire_date) / 365 AS year
FROM employees; -- 년수

-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual; -- 정오를 기준으로 반올림
SELECT ROUND(sysdate, 'year') FROM dual; -- 1년의 반(6월 말)을 기준으로 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 15일 기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 해당 주의 일요일 날짜 기준으로 반올림

SELECT TRUNC(sysdate) FROM dual; -- 정오를 기준으로 절사
SELECT TRUNC(sysdate, 'year') FROM dual; -- 1년의 반(6월 말)을 기준으로 절사
SELECT TRUNC(sysdate, 'month') FROM dual; -- 15일 기준으로 절사
SELECT TRUNC(sysdate, 'day') FROM dual; -- 해당 주의 일요일 날짜 기준으로 절사

-- 비교 연산자에서 <>는 같지 않다
