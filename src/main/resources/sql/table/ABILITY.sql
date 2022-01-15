/* 
 * ABILITY - Character ability data.
 */

-- drop table mpq_data.ability ; 

create table mpq_data.ability (
	ability_id varchar(100) primary key, 
    name varchar(250) not null, 
    description varchar(500) not null, 
    color varchar(50) not null, 
    cost integer
); 

comment on table mpq_data.ability is 'Core identity data for character abilities';

