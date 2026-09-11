SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_mem (p_letter VARCHAR2) IS
        SELECT member_id, member_name, course
        FROM lib_member
        WHERE UPPER(member_name) LIKE UPPER(p_letter) || '%'
        ORDER BY member_id;
    v_letter VARCHAR2(1) := UPPER('&letter');
BEGIN
    FOR r IN c_mem(v_letter) LOOP
        DBMS_OUTPUT.PUT_LINE(r.member_id || ' - ' || r.member_name || ' - ' || r.course);
    END LOOP;
END;
/
