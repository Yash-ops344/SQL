use assignment;
create table city(
city_id  int primary key auto_increment,
city_name varchar(50) not null,
lat float not null,
longitute float not null,
country_id int,
foreign key(country_id) references country(country_id)
);
create table customer(
cust_id  int primary key auto_increment,
cust_name varchar(50) not null,
city_id int,
foreign key (city_id) references city(city_id),
cust_add varchar(50),
next_call_date date,
ts_inserted datetime default current_timestamp 
);
create table country(
country_id  int primary key auto_increment,
country_name varchar(50) not null,
country_name_eng varchar(50) not null,
country_code varchar(50)
);


insert into country values
(1,'Deutschland','germany','DEU');
insert into country values
(2,'srbija','serbia','SRB'),
(3,'hrvatska','croatia','HRV'),
(4,'united state of america','united state of america','USA'),
(5,'polska','poland','POL'),
(6,'espana','spain','ESP'),
(7,'rossiya','russia','RUS');

insert into city values
(1,'berlin','52.520008','13.404954',1);
insert into city values
(2,'belgrade','44.787197','20.457273',2),
(3,'zagreb','45.815399','15.966568',3),
(4,'new york','40.730610','-73.935242',4),
(5,'los angeles','34.052235','-118.243683',4),
(6,'warsaw','52.237049','21.017532',5);

insert into customer values
(1,'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20'),
(2,'Bakery', 1, 'Kurfürstendamm 25', '2020-02-21', '2020-01-09 17:52:15'),
(3,'Cafe', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49'),
(4,'Restaurant', 3, 'Ulica lipa 15', '2020-01-21', '2020-01-10 09:20:21'); 

select * from city;
select * from country;
select * from customer;

-- task : 1 (join multiple tables using left join) 
-- List all Countries and customers related to these countries.
select c.city_id, c.cust_name, o.country_name_eng, o.country_id, ci.city_id, ci.country_id
from city ci
left join country o 
on ci.country_id = o.country_id
left join customer c 
on ci.city_id = c.city_id;

-- Task : 2 (join multiple tables using both left and inner join) 
select ci.city_id,ci.country_id,c.country_id,c.country_name_eng,cu.city_id,cu.cust_name
from city ci
left join country c
on ci.country_id=c.country_id
inner join customer cu
on cu.city_id = ci.city_id;