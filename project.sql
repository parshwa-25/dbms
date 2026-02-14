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
    mode_of_payment varchar(15) check (mode_of_payment in('UPI', 'Cash', 'Pending')),
    amount number(10,2),
    order_id number(5) references orders(order_id)
);
insert into customer
values(1, 'Parshwa', 1234567890, 'parshwa@gmail.com', 'Surat');
insert into customer
values(2, 'Neev', 1234586890, 'neev@gmail.com', 'Surat');
insert into customer
values(3, 'Vansh', 3234567890, 'vansh@gmail.com', 'Surat');
insert into customer
values(4, 'Tirth', 3234567590, 'tirth@gmail.com', 'Surat');
insert into customer
values(5, 'Neel', 13434567890, 'neel@gmail.com', 'Surat');

insert into orders
values(1, 1, '10/02/2026', 1000, 'Completed');
insert into orders
values(2, 2, '11/02/2026', 2000, 'Completed');
insert into orders
values(3, 3, '11/02/2026', 1500, 'Completed');
insert into orders
values(4, 4, '12/02/2026', 1200, 'Pending');
insert into orders
values(5, 5, '13/02/2026', 3000, 'Pending');

insert into payment
values(101, '10/02/2026', 'UPI', 1000, 1);
insert into payment
values(102, '11/02/2026', 'Cash', 2000, 2);
insert into payment
values(103, '11/02/2026', 'Cash', 1500, 3);
insert into payment
values(104, '12/02/2026', 'Pending', 1200, 4);
insert into payment
values(105, '13/02/2026', 'Pending', 3000, 5);

select * from customer;
select * from orders;
select * from payment;