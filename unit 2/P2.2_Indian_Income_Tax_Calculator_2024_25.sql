SET SERVEROUTPUT ON;

DECLARE
    seed NUMBER := 20;
    gross_salary NUMBER;
    taxable_income NUMBER;
    total_tax NUMBER := 0;
    monthly_tds NUMBER;
    take_home NUMBER;
BEGIN
    gross_salary := seed * 50000;
    taxable_income := GREATEST(gross_salary - 75000, 0);

    SELECT CASE
        WHEN taxable_income <= 300000 THEN 0
        WHEN taxable_income <= 700000 THEN (taxable_income - 300000) * 0.05
        WHEN taxable_income <= 1000000 THEN 20000 + (taxable_income - 700000) * 0.10
        WHEN taxable_income <= 1200000 THEN 50000 + (taxable_income - 1000000) * 0.15
        WHEN taxable_income <= 1500000 THEN 80000 + (taxable_income - 1200000) * 0.20
        ELSE 140000 + (taxable_income - 1500000) * 0.30
    END INTO total_tax FROM dual;

    monthly_tds := total_tax / 12;
    take_home := (gross_salary - total_tax) / 12;

    DBMS_OUTPUT.PUT_LINE('===== INCOME TAX BREAKDOWN =====');
    DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs.' || ROUND(gross_salary,2));
    DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs.75000');
    DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs.' || ROUND(taxable_income,2));
    DBMS_OUTPUT.PUT_LINE('Total Tax: Rs.' || ROUND(total_tax,2));
    DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs.' || ROUND(monthly_tds,2));
    DBMS_OUTPUT.PUT_LINE('Take-home Monthly Salary: Rs.' || ROUND(take_home,2));

    IF total_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year — save more with PPF/ELSS!');
    END IF;
END;
/