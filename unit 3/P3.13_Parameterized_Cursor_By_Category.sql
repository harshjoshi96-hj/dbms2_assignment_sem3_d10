SET SERVEROUTPUT ON;

-- Enter Database, run the block, then run it again with Programming.
DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_cat);
    v_category VARCHAR2(25) := '&category';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_category);
    FOR r IN c_book(v_category) LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
