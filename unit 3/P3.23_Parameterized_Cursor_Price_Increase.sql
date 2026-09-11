SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_cat)
        FOR UPDATE OF price;
BEGIN
    FOR r IN c_book('Database') LOOP
        UPDATE book
        SET price = price * 1.10
        WHERE CURRENT OF c_book;
        DBMS_OUTPUT.PUT_LINE(r.title || ' : Old Price = Rs.' || r.price ||
                             ', New Price = Rs.' || ROUND(r.price * 1.10, 2));
    END LOOP;
    COMMIT;
END;
/
