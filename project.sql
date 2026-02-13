create table customer (
    cust_id number(5) primary key,
    name varchar(20) not null,
    mob_no number(10) not null,
    email varchar(30) not null,
    city varchar(20) not null
);

create table orders (
    order_id number(5) primary key,
    cust_id number(5) references customer(cust_id),
    order_date date not null,
    total_amt number(10,2),
    order_status varchar(30) check (order_status in('Pending', 'Completed'))
);

create table payment (
    payment_id number(10),
    payment_date date not null,
    mode_of_payment varchar(15) check (mode_of_payment in('UPI', 'Cash')),
    amount number(10,2),
    order_id number(5) references orders(order_id)
);

insert into customer
values(1, 'Parshwa', 9023121151, 'parshwa@gmail.com', 'Surat');

select * from customer;