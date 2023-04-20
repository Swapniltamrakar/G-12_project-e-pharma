create table customer (
cid int primary key auto_increment,
cname varchar(30),
cus_age int check(cus_age > 18)
caddress text,
cpres text not null
);

create table order (
order_id int primary key auto_increment,
order_date date not null,
cid int,
ad_id int,
Did int,
constraint fk_cid foriegn key (cid) references customer(cid) on update cascade,
constraint fk_ad_id foriegn key (ad_id) references admin(ad_id) on update cascade,
constraint fk_Did foriegn key (cid) references Delivery_person(Did) on update cascade, on delete set null
);

create table vendor(
vid int primary key,
vname varchar(40) not null,
Vlicence_no. varchar(20) not null unique,
vaddress varchar(30) not null,
ad_id int,
constraint fk_ad_id (ad_id) references admin(ad_id) on update cascade
);

create table admin (
ad_id int primary key,
ad_name varchar(20) not null,
ad-mobile varchar(11) unique not null
);

create table delivery(
Did int primary key,
dname varchar(20) not null,
dmobile varchar(11) not null unique
);

create table amount(
order_id int,
prod_id int,
prod_qty int not null check(prod_qty > 0),
amount double (10,2) check(amount > 0) not null,
primary key(order_id,prod_id),
constraint fk_order_id foriegn key (order_id) references order(order_id),
constraint fk_prod_id foriegn key (prod_id) references product(prod_id),
);

create table stock_table(
prod_id int,
vid int,
stock int,
constraint fk_prod_id foriegn key (prod_id) references product(prod_id),
constraint fk_vid foriegn key (vid) references vendor(vid)
);
