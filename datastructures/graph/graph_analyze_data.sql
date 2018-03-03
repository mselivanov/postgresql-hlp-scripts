-- Select all immediate relationships for a company
with company_of_interest as (
    select 
            v.vertex_id,
            v.vertex_data
      from vertex v
     where (v.vertex_data ->> 'name') = 'Stark Industries'
)
select 
        (coi.vertex_data ->> 'name') as company_from,
        (v.vertex_data ->> 'name') as company_to,
        e.*
  from company_of_interest coi
  join bidirected_edge e on coi.vertex_id = e.vertex_from_id
  join vertex v on e.vertex_to_id = v.vertex_id;
 
-- Discover transitive relationships
-- If A relates to B and B relates to C, A also relates to C
with recursive company_of_interest as (
    select 
            v.vertex_id,
            v.vertex_data
      from vertex v
     where (v.vertex_data ->> 'name') = 'Stark Industries'
), 
labels_of_interest as (
    select edge_label, reverse_edge_label 
      from ref_edge_label
     where edge_label in ('secretely owns', 'partnership')
     --where edge_label in ('partnership')
), 
transitive_relationships(root_vertex_id, linked_vertex_id, edge_label, edge_data, is_reverse_edge) as
(
    select 
            coi.vertex_id as root_vertex_id,
            e.vertex_to_id as linked_vertex_id,
            e.edge_label,
            e.edge_data,
            e.is_reverse_edge
      from bidirected_edge e
      join company_of_interest coi on e.vertex_from_id = coi.vertex_id
     where e.edge_label in (select loi.edge_label from labels_of_interest loi)
     union all
    select
            tr.root_vertex_id,
            e.vertex_to_id as linked_vertex_id,
            e.edge_label,
            e.edge_data,
            e.is_reverse_edge
      from transitive_relationships tr
      join bidirected_edge e on tr.linked_vertex_id = e.vertex_from_id and tr.edge_label = e.edge_label and e.is_reverse_edge = tr.is_reverse_edge
)
select  
        (v1.vertex_data->>'name') as root_company_name,
        tr.edge_label,
        (v2.vertex_data->>'name') as linked_company_name,
        tr.edge_data 
  from transitive_relationships tr 
  join vertex v1 on tr.root_vertex_id = v1.vertex_id
  join vertex v2 on tr.linked_vertex_id = v2.vertex_id;
