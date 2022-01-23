/*
 * DISPLAY_CHARACTER_VW - Display charcter and level data by effective level and locale language.
 */

drop view if exists mpq_data.display_character_vw ; 

create or replace view mpq_data.display_character_vw as (
    select mch.mpq_character_id, 
           nam.text as name, 
           sub.text as subtitle, 
           mch.rarity,        
           mch.release_date, 
           bio.text as character_bio, 
           lcn.display_level, 
           lcn.effective_level, 
           loc.locale_language
    from mpq_data.mpq_character mch
             join (         
                      select distinct(ltx.locale_language)
                      from mpq_data.locale_text ltx
                      where 1=1 
                  ) loc
                 on  1=1 
             join mpq_data.locale_text nam
                 on  nam.text_key = mch.name_key 
                 and nam.locale_language = loc.locale_language
             join mpq_data.locale_text sub
                 on  sub.text_key = mch.subtitle_key 
                 and sub.locale_language = loc.locale_language
             join mpq_data.locale_text bio
                 on  bio.text_key = mch.character_bio_key
                 and bio.locale_language = loc.locale_language
             join mpq_data.level_conversion lcn
                 on  lcn.rarity = mch.rarity 
    where 1=1 
);

comment on view mpq_data.display_character_vw is 'Associating character, level, and locale text data into one view.';

