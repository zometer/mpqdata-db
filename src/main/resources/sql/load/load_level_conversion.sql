/*
 * Load effective level conversion table.
 */

copy mpq_data.level_conversion (rarity, effective_level, display_level)
from '/docker-entrypoint-initdb.d/level_conversion-initial-load.csv'
delimiter ','
csv header
;