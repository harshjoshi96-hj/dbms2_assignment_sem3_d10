SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, stock
        FROM book
        WHERE category = 'Database'
        FOR UPDATE OF stock;
BEGIN
    FOR r IN c_book LOOP
        UPDATE book
        SET stock = stock + 10
        WHERE CURRENT OF c_book;
        DBMS_OUTPUT.PUT_LINE(r.title || ' : Old Stock = ' || r.stock || ', New Stock = ' || (r.stock + 10));
    END LOOP;
    COMMIT;
END;
/
