/* 
 * MPQ_CHARACTER - Character identity data.
 */

-- drop table mpq_data.mpq_character ; 

create table mpq_data.mpq_character (
	mpq_charcter_id varchar(100) primary key, 
    name varchar(250) not null, 
    subtitle varchar(250) not null, 
    rarity integer not null, 
    release_date timestamp
); 

comment on table mpq_data.mpq_character is 'Character identity data';

