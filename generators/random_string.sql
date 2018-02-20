-- Generate random string consisting of all uppercase ascii characters
with configuration as (
    select 
            cast(65 as int) as start_char,
            cast(90 as int) as end_char,            
            cast(20 as int) as char_seq_len,
            cast(10 as int) as number_of_strings 
), 
random_code_points as (
 select 
        cast(ceiling(cfg.start_char + random()*(cfg.end_char - cfg.start_char)) as int) as code_point,
        string_id
    from configuration cfg
   cross join generate_series(1, cfg.char_seq_len)
   cross join generate_series(1, cfg.number_of_strings) as t(string_id)
) 
    select 
            array_to_string(array_agg(chr(code_point)), '') as random_string, 
            string_id
      from random_code_points
     group by string_id;   
 