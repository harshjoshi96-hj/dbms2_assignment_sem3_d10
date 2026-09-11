SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price, stock FROM book;
    v_total NUMBER := 0;
BEGIN
    FOR r IN c_book LOOP
        DBMS_OUTPUT.PUT_LINE(r.title || ' : Rs.' || (r.price * r.stock));
        v_total := v_total + (r.price * r.stock);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Grand Total Stock Value = Rs.' || v_total);
END;
/
