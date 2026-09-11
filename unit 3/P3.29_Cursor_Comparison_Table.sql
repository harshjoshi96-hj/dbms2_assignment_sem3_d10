SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('CURSOR COMPARISON');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Implicit Cursor | Oracle declares/opens/closes it automatically | Not manually reusable with different cursor values | Best for single SQL statements such as INSERT, UPDATE, DELETE, SELECT INTO');
    DBMS_OUTPUT.PUT_LINE('Explicit Cursor | Programmer declares it | Programmer opens, fetches and closes it (or uses a cursor FOR loop) | Simple cursor: fixed query; parameterized cursor: reusable with different values | Best when processing multiple rows');
    DBMS_OUTPUT.PUT_LINE('Parameterized Cursor | Programmer declares it with formal parameters | Programmer opens it with values, or uses a cursor FOR loop | Yes, the same cursor can be reused with different parameter values | Best when the same multi-row query must run for different inputs');
END;
/
