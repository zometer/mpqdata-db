/*
 * ABILITY - Character ability data.
 */

-- drop table mpq_data.ability ;

create table mpq_data.ability (
	ability_id varchar(100) primary key,
	mpq_character_id varchar(100) references mpq_data.mpq_character(mpq_character_id),
	name_key varchar(250) not null,
	description_key varchar(500) not null,
	color varchar(50) not null,
	ordinal_position int not null,
	cost integer
);

comment on table mpq_data.ability is 'Core identity data for character abilities';

