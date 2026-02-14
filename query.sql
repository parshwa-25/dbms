select cust_id, sum(total_amt) from orders group by cust_id;

select c.cust_id, c.name, o.order_status, o.total_amt from customer c join orders o on c.cust_id = o.cust_id where o.order_status = 'Completed';

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
    
BEGIN
END;