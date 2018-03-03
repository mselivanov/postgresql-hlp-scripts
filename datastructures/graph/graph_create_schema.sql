/*
    Script creates graph storage schema
*/

drop schema if exists graph_test cascade;
create schema graph_test;
--drop table if exists edge;
--drop table if exists vertex;

create extension if not exists "uuid-ossp" schema public;

set schema 'graph_test';
set search_path to graph_test, public;

create table vertex(
    vertex_id       uuid not null constraint pk_vertex primary key default uuid_generate_v1(),
    vertex_data     jsonb not null,
    created_ts      timestamp not null default current_timestamp,
    updated_ts      timestamp not null default current_timestamp    
);

create table ref_edge_label (
    edge_label          text not null constraint pk_ref_edge_label primary key,
    reverse_edge_label  text not null
);
create unique index idx_ref_edge_label_edge_label on ref_edge_label(lower(edge_label));
create unique index idx_ref_edge_label_reverse_edge_label on ref_edge_label(lower(reverse_edge_label));

create table edge(
    edge_id         uuid not null constraint pk_edge primary key default uuid_generate_v1(),
    vertex_from_id  uuid not null constraint fk_edge_vertex_from references vertex(vertex_id),
    vertex_to_id    uuid not null constraint fk_edge_vertex_to references vertex(vertex_id),
    edge_label      text not null constraint fk_edge_ref_edge_label references ref_edge_label(edge_label),
    edge_data       jsonb not null,
    created_ts      timestamp not null default current_timestamp,
    updated_ts      timestamp not null default current_timestamp  
);

create index idx_edge_vertex_from_id on edge(vertex_from_id);
create index idx_edge_vertex_to_id on edge(vertex_to_id);
create index idx_edge_edge_label on edge(edge_label);

create view bidirected_edge as 
select 
       e.edge_id,
       e.vertex_from_id,
       e.vertex_to_id,
       e.edge_label,
       e.edge_data,
       false as is_reverse_edge
  from edge e
 union all
select 
       e.edge_id,
       e.vertex_to_id as vertex_from_id,
       e.vertex_from_id as vertex_to_id,
       rel.reverse_edge_label,
       e.edge_data,
       true as is_reverse_edge
  from edge e
  join ref_edge_label rel on e.edge_label = rel.edge_label;
