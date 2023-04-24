
-- WHILE��

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

-- Ż�⹮
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

-- FOR��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-- CONTINUE��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;
END;

-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��
DECLARE
    
BEGIN

    FOR i IN 2..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        FOR j IN 1..9
        LOOP
        dbms_output.put_line(i || 'x' || j || '=' || i*j);
        END LOOP;
    END LOOP;
    
END;

-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno SEQUENCE�� �÷��ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1

CREATE TABLE board (
    bno NUMBER PRIMARY KEY,
    writer VARCHAR2(20),
    title VARCHAR2(20)
);

SELECT * FROM board;

DECLARE
    
BEGIN

    FOR i IN 1..300 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        INSERT INTO board
            (bno, writer, title)
        VALUES
            (i, 'test'||i, 'title'||i);
    END LOOP;
    
END;































































