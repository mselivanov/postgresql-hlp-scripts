-- Table size in descending order for particular schema
with namespace as (
    select 
            n.oid, 
            n.nspname
      from pg_catalog.pg_namespace n
     where nspname = :schemaname
),
rel_size as (
select  
        n.nspname as schema_name,
        cl.relname as table_name,
        -- Total relation size in bytes including indexes and toast table
        pg_catalog.pg_total_relation_size(cl.oid) as total_size_bytes,
        -- Toast table size
        pg_catalog.pg_total_relation_size(cl.reltoastrelid) as toast_total_size_bytes,
        -- Indexes size
        pg_catalog.pg_indexes_size(cl.oid) as indexes_size_bytes
  from pg_catalog.pg_class cl  
  join namespace n on cl.relnamespace = n.oid
 -- ordinary tables
 where cl.relkind = 'r'
)
 select 
        rs.schema_name,
        rs.table_name,
        -- Total size - index size - toast table size
        rs.total_size_bytes - rs.indexes_size_bytes - rs.toast_total_size_bytes as total_table_size_bytes,
        rs.toast_total_size_bytes as total_toast_table_size_bytes,
        rs.indexes_size_bytes as indexes_size_bytes,
        pg_catalog.pg_size_pretty(rs.total_size_bytes - rs.indexes_size_bytes - rs.toast_total_size_bytes) as table_size,
        pg_catalog.pg_size_pretty(rs.indexes_size_bytes) as indexes_size,
        -- toast table size
        pg_catalog.pg_size_pretty(rs.toast_total_size_bytes) as toast_table_size
   from rel_size as rs
 order by total_table_size_bytes desc;
