SET SERVEROUTPUT ON;

DECLARE
    food_total NUMBER := 350;
    distance_km NUMBER := 5;
    rain CHAR(1) := 'Y';
    late_night CHAR(1) := 'N';
    festival CHAR(1) := 'N';
    peak_hour CHAR(1) := 'N';
    first_order CHAR(1) := 'N';
    base_charge NUMBER := 0;
    rain_charge NUMBER := 0;
    night_charge NUMBER := 0;
    festival_charge NUMBER := 0;
    peak_charge NUMBER := 0;
    discount NUMBER := 0;
    delivery NUMBER;
    grand_total NUMBER;
BEGIN
    IF distance_km < 3 THEN base_charge := 0;
    ELSIF distance_km <= 8 THEN base_charge := 29;
    ELSIF distance_km <= 15 THEN base_charge := 49;
    ELSE base_charge := 79;
    END IF;

    IF food_total > 499 THEN
        delivery := 0;
        discount := base_charge;
    ELSE
        SELECT CASE WHEN rain = 'Y' THEN ROUND(base_charge * 0.20) ELSE 0 END,
               CASE WHEN late_night = 'Y' THEN ROUND(base_charge * 0.15) ELSE 0 END,
               CASE WHEN festival = 'Y' THEN ROUND(base_charge * 0.10) ELSE 0 END,
               CASE WHEN peak_hour = 'Y' THEN ROUND(base_charge * 0.10) ELSE 0 END
        INTO rain_charge, night_charge, festival_charge, peak_charge FROM dual;
        delivery := base_charge + rain_charge + night_charge + festival_charge + peak_charge;
        IF first_order = 'Y' THEN
            discount := ROUND(delivery * 0.50);
            delivery := delivery - discount;
        END IF;
    END IF;

    grand_total := food_total + delivery;
    DBMS_OUTPUT.PUT_LINE('===== DELIVERY RECEIPT =====');
    DBMS_OUTPUT.PUT_LINE('Food Total: Rs.' || food_total);
    DBMS_OUTPUT.PUT_LINE('Distance: ' || distance_km || ' km');
    DBMS_OUTPUT.PUT_LINE('Base Delivery: Rs.' || base_charge);
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge: Rs.' || rain_charge);
    DBMS_OUTPUT.PUT_LINE('Late Night Surcharge: Rs.' || night_charge);
    DBMS_OUTPUT.PUT_LINE('Festival Surcharge: Rs.' || festival_charge);
    DBMS_OUTPUT.PUT_LINE('Peak Hour Surcharge: Rs.' || peak_charge);
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || discount);
    DBMS_OUTPUT.PUT_LINE('Final Delivery: Rs.' || ROUND(delivery));
    DBMS_OUTPUT.PUT_LINE('Grand Total: Rs.' || ROUND(grand_total));
END;
/