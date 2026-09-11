SET SERVEROUTPUT ON;

-- Cause: c_book is automatically opened and closed by the cursor FOR loop.
-- Therefore c_book%ROWCOUNT is invalid after the loop; line 178 raises ORA-01001.
-- The explicit CLOSE c_book would also be invalid because the cursor is already closed.

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title FROM book WHERE category = p_cat;
    v_count NUMBER := 0;
BEGIN
    FOR r IN c_book('Database') LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title);
        v_count := v_count + 1;
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No books found');
    END IF;
END;
/
