SET SERVEROUTPUT ON;

-- OPEN c_book without the required argument causes PLS-00306:
-- wrong number or types of arguments in call to 'C_BOOK'.
-- This is detected at compilation because the cursor call has a missing required argument.
-- With a DEFAULT value, the omitted argument is replaced by that default value.

DECLARE
    CURSOR c_book (p_cat VARCHAR2 DEFAULT 'Database') IS
        SELECT book_id, title FROM book WHERE category = p_cat;
    v_id book.book_id%TYPE;
    v_title book.title%TYPE;
BEGIN
    OPEN c_book;
    LOOP
        FETCH c_book INTO v_id, v_title;
        EXIT WHEN c_book%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id || ' - ' || v_title);
    END LOOP;
    CLOSE c_book;
END;
/
