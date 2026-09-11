SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_cat);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Category: Database');
    FOR r IN c_book('Database') LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Category: Programming');
    FOR r IN c_book('Programming') LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
