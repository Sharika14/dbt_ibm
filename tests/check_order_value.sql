{{config(store_failures=true)}}

select * from {{ref('stg_orders')}} where total_price< {{ var('v_min_order')}}
