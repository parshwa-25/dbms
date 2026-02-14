select cust_id, sum(total_amt) from orders group by cust_id;

select c.cust_id, c.name, o.order_status, o.total_amt from customer c join orders o on c.cust_id = o.cust_id where o.order_status = 'Completed';

select c.cust_id, c.name, p.mode_of_payment, sum(p.amount) from customer c join orders o on c.cust_id = o.cust_id join payment p on o.order_id = p.order_id where p.mode_of_payment = 'Cash';

select * from orders where total_amt > (select avg(total_amt) from orders);

DECLARE
    n number(5);
    i number;
    total_num number := 0;
BEGIN
    n:=:n;
    for i in 1..n loop
        total_num := total_num + i;
    end loop;
    dbms_output.put_line('Sum of first N Numbers : ' || total_num);
END;

DECLARE
    v_pay payment%rowtype;
BEGIN
    v_pay.order_id:=:order_id;
    select * into v_pay from payment where order_id = v_pay.order_id;
    IF v_pay.order_id >= 1 and v_pay.order_id <= 5 THEN
        v_pay.payment_id:=:payment_id;
        IF v_pay.payment_id >= 101 and v_pay.payment_id <= 105 THEN
            dbms_output.put_line('Payment ID: ' || v_pay.payment_id);
            dbms_output.put_line('Payment Date: ' || v_pay.payment_date);
            dbms_output.put_line('Mode of Payment: ' || v_pay.mode_of_payment);
            dbms_output.put_line('Amount: ' || v_pay.amount);
            dbms_output.put_line('Order ID: ' || v_pay.order_id);
        ELSE
            dbms_output.put_line('Invalid payment ID for the given order ID.');
        END IF;
    ELSE
        dbms_output.put_line('No payment found for the given order ID.');
    END IF;
END;

DECLARE
    v_pay payment%rowtype;
    NO_PAYMENTID_FOUND EXCEPTION;
BEGIN
    v_pay.payment_id:=:payment_id;
    select * into v_pay from payment where payment_id = v_pay.payment_id;
    if v_pay.payment_id >= 101 and v_pay.payment_id <= 105 THEN
        dbms_output.put_line('Payment ID: ' || v_pay.payment_id);
        dbms_output.put_line('Payment Date: ' || v_pay.payment_date);
        dbms_output.put_line('Mode of Payment: ' || v_pay.mode_of_payment);
        dbms_output.put_line('Amount: ' || v_pay.amount);
        dbms_output.put_line('Order ID: ' || v_pay.order_id);
    ELSE
        RAISE NO_PAYMENTID_FOUND;
    END IF;
    EXCEPTION
        WHEN NO_PAYMENTID_FOUND THEN
            dbms_output.put_line('No payment found for the given payment ID.');
END;