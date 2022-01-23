/*
 * MPQ_CHARACTER - Character identity data.
 */

drop table if exists mpq_data.mpq_character ;

create table mpq_data.mpq_character (
	mpq_character_id varchar(100) primary key,
	name_key varchar(250) not null,
	subtitle_key varchar(250) not null,
	rarity integer not null,
	character_bio_key varchar(250) not null, 
	release_date timestamp
);

comment on table mpq_data.mpq_character is 'Character identity data';

