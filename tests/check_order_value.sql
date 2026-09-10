{{config(store_failures=true)}}

select * from {{ref('stg_orders')}} where total_price<880
