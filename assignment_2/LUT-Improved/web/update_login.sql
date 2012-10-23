drop table users;

create table users(
login varchar(26) NOT NULL,
password varchar(26) NOT NULL,
PRIMARY KEY (login)
);

insert into users values ('adrienoa', 'azerty');
insert into users values ('aubertad','toto');

drop table admin_users;

create table admin_users(
login varchar(26) NOT NULL,
PRIMARY KEY (login)
);

insert into admin_users values ('aubertad');