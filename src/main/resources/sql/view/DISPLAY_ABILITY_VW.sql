/*
 * DISPLAY_ABILITY_VW - combining ability and locale language.
 */

drop view if exists mpq_data.display_ability_vw ; 


create or replace view mpq_data.display_ability_vw as (
    select abl.ability_id, 
           abl.mpq_character_id, 
           abl.ordinal_position, 
           abl.color, 
           abl.cost, 
           nam.text as name, 
           ads.text as description
    from mpq_data.ability abl 
             join (         
                      select distinct(ltx.locale_language)
                      from mpq_data.locale_text ltx
                      where 1=1 
                  ) loc
                 on  1=1 
             join mpq_data.locale_text nam 
                 on  nam.locale_language = loc.locale_language
                 and nam.text_key = abl.name_key 
             join mpq_data.locale_text ads
                 on  ads.locale_language = loc.locale_language
                 and ads.text_key = abl.description_key 
    where 1=1 
);

comment on view mpq_data.display_ability_vw is 'Associating ability and locale text data into one view.';

