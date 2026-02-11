create table customer (
    id number(5) primary key,
    name varchar(20) not null,
    mob_no number(10) not null,
    email varchar(30) not null,
    city varchar(20) not null
);

insert into customer
values(1, 'Parshwa', 9023121151, 'parshwa@gmail.com', 'Surat');

select * from customer;