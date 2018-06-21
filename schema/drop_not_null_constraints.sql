with ns as (
select 
       *,
       n.oid
  from pg_catalog.pg_namespace n
 where n.nspname = '<namespace of interest>'
 ), 
 tbls as (
    select
            c.*,
            c.oid
      from pg_catalog.pg_class c
      join ns n on c.relnamespace = n.oid
     where c.relname like '<condition>' escape '\'
       and c.relkind = 'r'
 ),
 tbl_cols as (
    select *
      from pg_catalog.pg_attribute a
      join tbls t on a.attrelid = t.oid
     where a.attnotnull
      -- column isn't in PK
       and not exists (
        select 1
          from pg_catalog.pg_index i
         where i.indrelid = t.oid
           and i.indisprimary
           and a.attnum = any (i.indkey)
       ) and a.attnum > 0
 )
 select 'alter table ' || a.relname || ' alter column ' || a.attname || ' drop not null;' 
   from tbl_cols a;
