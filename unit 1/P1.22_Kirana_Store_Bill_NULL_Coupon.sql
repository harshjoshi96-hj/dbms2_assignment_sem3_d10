-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.22 Kirana Store Bill with NULL Coupon

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_qty    NUMBER := MOD(&roll_no, 5) + 2;
    v_price  NUMBER := &roll_no * 100 + 400;
    v_coupon NUMBER := NULL; -- Run once with NULL, then change to 10.
    v_gross  NUMBER;
    v_disc   NUMBER;
    v_taxable NUMBER;
    v_cgst   NUMBER;
    v_sgst   NUMBER;
    v_total  NUMBER;
BEGIN
    v_gross := v_qty * v_price;
    v_disc := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_disc;
    v_cgst := v_taxable * 9 / 100;
    v_sgst := v_taxable * 9 / 100;
    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('========== KIRANA STORE BILL ==========');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price Each: Rs.' || TO_CHAR(v_price, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || TO_CHAR(v_gross, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '%', 'No coupon'));
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || TO_CHAR(v_disc, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Taxable Amount: Rs.' || TO_CHAR(v_taxable, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs.' || TO_CHAR(v_cgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs.' || TO_CHAR(v_sgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs.' || TO_CHAR(v_total, '99,999'));
END;
/

-- To perform the second required run, change v_coupon from NULL to 10.