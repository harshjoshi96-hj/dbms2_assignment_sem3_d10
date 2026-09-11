SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price FROM book;
BEGIN
    FOR r IN c_book LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
    -- Oracle automatically performed DECLARE/OPEN, FETCH, and CLOSE for the cursor FOR loop.
END;
/
