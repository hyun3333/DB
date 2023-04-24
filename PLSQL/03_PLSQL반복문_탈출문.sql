
-- WHILE문

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1;
    END LOOP;
END;

-- 탈출문
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP;
END;

-- FOR문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요
DECLARE
    
BEGIN

    FOR i IN 2..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        FOR j IN 1..9
        LOOP
        dbms_output.put_line(i || 'x' || j || '=' || i*j);
        END LOOP;
    END LOOP;
    
END;

-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno SEQUENCE로 올려주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
-- ex) 1, test1, title1

CREATE TABLE board (
    bno NUMBER PRIMARY KEY,
    writer VARCHAR2(20),
    title VARCHAR2(20)
);

SELECT * FROM board;

DECLARE
    
BEGIN

    FOR i IN 1..300 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        INSERT INTO board
            (bno, writer, title)
        VALUES
            (i, 'test'||i, 'title'||i);
    END LOOP;
    
END;































































