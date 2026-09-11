SET SERVEROUTPUT ON;

DECLARE
    seed NUMBER := 20;
    monthly_salary NUMBER := seed * 5000;
    existing_emi NUMBER := seed * 500;
    loan_amount NUMBER := seed * 250000;
    annual_rate NUMBER := 10;
    tenure_months NUMBER := 60;
    monthly_rate NUMBER := annual_rate / 12 / 100;
    foir_limit NUMBER;
    emi NUMBER;
    approved_amount NUMBER := 0;
    test_loan NUMBER;
    decision VARCHAR2(20);
BEGIN
    foir_limit := monthly_salary * 0.40;
    emi := loan_amount * monthly_rate * POWER(1 + monthly_rate, tenure_months) /
           (POWER(1 + monthly_rate, tenure_months) - 1);

    IF monthly_salary < 25000 THEN
        approved_amount := 0;
        decision := 'REJECTED';
    ELSIF loan_amount > monthly_salary * 60 THEN
        approved_amount := 0;
        decision := 'REJECTED';
    ELSIF existing_emi + emi <= foir_limit THEN
        approved_amount := loan_amount;
        decision := 'APPROVED';
    ELSE
        test_loan := loan_amount;
        WHILE test_loan > 0 LOOP
            emi := test_loan * monthly_rate * POWER(1 + monthly_rate, tenure_months) /
                   (POWER(1 + monthly_rate, tenure_months) - 1);
            EXIT WHEN existing_emi + emi <= foir_limit;
            test_loan := test_loan - 10000;
        END LOOP;
        IF test_loan <= 0 THEN
            approved_amount := 0;
            decision := 'REJECTED';
        ELSE
            approved_amount := test_loan;
            decision := 'CONDITIONAL';
        END IF;
    END IF;

    emi := CASE WHEN approved_amount > 0 THEN
        approved_amount * monthly_rate * POWER(1 + monthly_rate, tenure_months) /
        (POWER(1 + monthly_rate, tenure_months) - 1)
        ELSE 0 END;

    DBMS_OUTPUT.PUT_LINE('===== LOAN AFFORDABILITY REPORT =====');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs.' || monthly_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs.' || existing_emi);
    DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs.' || loan_amount);
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure: ' || tenure_months || ' months');
    DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs.' || ROUND(emi,2));
    DBMS_OUTPUT.PUT_LINE('FOIR Limit (40%): Rs.' || ROUND(foir_limit,2));
    DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs.' || approved_amount);
    SELECT CASE decision WHEN 'APPROVED' THEN 'APPROVED' WHEN 'CONDITIONAL' THEN 'CONDITIONAL' ELSE 'REJECTED' END INTO decision FROM dual;
    DBMS_OUTPUT.PUT_LINE('Decision: ' || decision);
    DBMS_OUTPUT.PUT_LINE('Total Monthly EMI Cost: Rs.' || ROUND(existing_emi + emi,2));
    DBMS_OUTPUT.PUT_LINE('Remaining Monthly Income: Rs.' || ROUND(monthly_salary - existing_emi - emi,2));
END;
/