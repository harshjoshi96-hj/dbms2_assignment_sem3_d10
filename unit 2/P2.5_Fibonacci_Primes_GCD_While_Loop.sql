SET SERVEROUTPUT ON;

DECLARE
    roll_no NUMBER := 20;
    n NUMBER := 5 + MOD(roll_no,8);
    a NUMBER := 0; b NUMBER := 1; c NUMBER; i NUMBER := 1; last_fib NUMBER := 0;
    divisor NUMBER; is_prime BOOLEAN; prime_count NUMBER := 0;
    gcd_a NUMBER := 48; gcd_b NUMBER := 18; r NUMBER;
    perfect_num NUMBER := 28; d NUMBER := 1; divisor_sum NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: FIBONACCI =====');
    WHILE i <= n LOOP
        DBMS_OUTPUT.PUT(a);
        IF i < n THEN DBMS_OUTPUT.PUT(', '); END IF;
        last_fib := a; c := a + b; a := b; b := c; i := i + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Nth Fibonacci Number: ' || last_fib);

    DBMS_OUTPUT.PUT_LINE('===== PART B: PRIME CHECK =====');
    IF last_fib < 2 THEN is_prime := FALSE;
    ELSE
        is_prime := TRUE; divisor := 2;
        WHILE divisor * divisor <= last_fib LOOP
            IF MOD(last_fib, divisor) = 0 THEN is_prime := FALSE; EXIT; END IF;
            divisor := divisor + 1;
        END LOOP;
    END IF;
    IF is_prime THEN DBMS_OUTPUT.PUT_LINE(last_fib || ' is PRIME');
    ELSE DBMS_OUTPUT.PUT_LINE(last_fib || ' is NOT PRIME'); END IF;

    DBMS_OUTPUT.PUT_LINE('===== PART C: PRIMES 1 TO 100 =====');
    i := 2;
    WHILE i <= 100 LOOP
        divisor := 2; is_prime := TRUE;
        WHILE divisor * divisor <= i LOOP
            IF MOD(i, divisor) = 0 THEN is_prime := FALSE; EXIT; END IF;
            divisor := divisor + 1;
        END LOOP;
        IF is_prime THEN DBMS_OUTPUT.PUT(i || ' '); prime_count := prime_count + 1; END IF;
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Prime Count: ' || prime_count);

    DBMS_OUTPUT.PUT_LINE('===== PART D: GCD =====');
    WHILE gcd_b <> 0 LOOP
        r := MOD(gcd_a, gcd_b); gcd_a := gcd_b; gcd_b := r;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('GCD: ' || gcd_a);

    DBMS_OUTPUT.PUT_LINE('===== PART E: PERFECT NUMBER =====');
    d := 1;
    WHILE d < perfect_num LOOP
        IF MOD(perfect_num,d) = 0 THEN divisor_sum := divisor_sum + d; END IF;
        d := d + 1;
    END LOOP;
    IF divisor_sum = perfect_num THEN DBMS_OUTPUT.PUT_LINE(perfect_num || ' is PERFECT');
    ELSE DBMS_OUTPUT.PUT_LINE(perfect_num || ' is NOT PERFECT'); END IF;
END;
/