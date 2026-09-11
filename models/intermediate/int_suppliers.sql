-- incremental processing

-- {{ config(materialized='incremental') }}

-- with supplier as (
--     select * from {{ ref('stg_suppliers') }} 
 
--     {% if is_incremental() %}
--     where updated_time > (select max(updated_time) from {{ this }})
--     {% endif %})
    
-- select * from supplier

-- {{ config(materialized='incremental', unique_key='supplier_id') }}

-- with supplier as (

--     select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
--     from {{ ref('stg_suppliers') }} s
--     join dbt_sharika.supplier_names n on s.supplier_id = n.skey

--     {% if is_incremental() %}
--     where updated_time > (select max(updated_time) from {{ this }})
--     {% endif %} )

-- select * from supplier


{{ config(materialized='incremental', unique_key='supplier_id',
incremental_predicates = ['DBT_INTERNAL_SOURCE.account_balance > 9900']) }}

with supplier as (

    select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
    from {{ ref('stg_suppliers') }} s
    join dbt_sharika.supplier_names n on s.supplier_id = n.skey 
    
    {% if is_incremental() %}
        where updated_time > (select max(updated_time) from {{ this }})
    {% endif %}
    )

select * from supplier



 


 
