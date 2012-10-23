drop table users;

create table users(
login varchar(26) NOT NULL,
password varchar(128) NOT NULL,
PRIMARY KEY (login)
);

insert into users values ('adrienoa', '$2a$13$xkJmx2SdSUAAcdm2Thj1dulqsHIgtw.HZEDagr/4AkhyZApeCYxNi');
insert into users values ('aubertad','$2a$13$JV7Q6U2w5rditz6n6Lev7OvIWoUmIrarPk9I1TiMgYCqVOY..NWLW');

drop table admin_users;

create table admin_users(
login varchar(26) NOT NULL,
PRIMARY KEY (login)
);

insert into admin_users values ('aubertad');