with ns as (
select 
       *,
       n.oid
  from pg_catalog.pg_namespace n
 where n.nspname = '<namespace>'
 ), 
 tbls as (
    select
            c.*,
            c.oid
      from pg_catalog.pg_class c
      join ns n on c.relnamespace = n.oid
     where c.relname like '<table condition>' escape '\'
       and c.relkind = 'r'
 ),
 tbl_cols as (
    select *
      from pg_catalog.pg_attribute a
      join tbls t on a.attrelid = t.oid
     where a.attname in ('<column names>')
 )
 select 'alter table ' || a.relname || ' drop column ' || a.attname || ';' 
   from tbl_cols a;
