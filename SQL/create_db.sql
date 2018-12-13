create table employees
(eid varchar(3) not null,
 ename varchar(15),
 city varchar(15),
 primary key(eid));

create table customers
(cid varchar(4) not null,
 cname varchar(15),
 city varchar(15),
 visits_made int(5),
 last_visit_time datetime,
 primary key(cid));

create table suppliers
      (sid varchar(2) not null,
       sname varchar(15) not null,
       city varchar(15),
       telephone_no char(10),
       primary key(sid),
       unique(sname));

create table products
(pid varchar(4) not null,
 pname varchar(15) not null,
 qoh int(5) not null,
 qoh_threshold int(5),
 original_price decimal(6,2),
 discnt_rate decimal(3,2),
 sid varchar(2),
 primary key(pid),
 foreign key (sid) references suppliers (sid));

create table purchases
(pur varchar(4)not null,
 cid varchar(4) not null,
 eid varchar(3) not null,
 pid varchar(4) not null,
 qty int(5),
 ptime datetime,
 total_price decimal(7,2),
 primary key (pur),
 foreign key (cid) references customers(cid),
 foreign key (eid) references employees(eid),
 foreign key (pid) references products(pid));

create table logs
      (logid int(5) not null auto_increment,
       who varchar(10) not null,
       time datetime not null,
       table_name varchar(20) not null,
       operation varchar(6) not null,
       key_value varchar(4),
       primary key (logid));