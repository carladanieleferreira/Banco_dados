/*create table time (codigo_time serial primary key, nome varchar(30));



create table atleta (codigo_atleta serial primary key, nome varchar(30));



insert into time(nome) values ('Fluminense')



 alter table atleta add column data_nascimento date

select * from atleta 


drop table atleta 

create table atleta (codigo_atleta serial primary key, nome varchar(50),
	data_nascimento date, codigo_time int,
	foreign key (codigo_time) references time (codigo_time));
insert into atleta (nome,data_nascimento, codigo_time)
					values('Arrascaeta', '1995-08-21', 1),('Luis Henrique', '2005-08-21', 4)


*/

select *from atleta 

