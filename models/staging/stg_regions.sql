with region as(
    select
    r_regionkey region_id,
    r_name name,
    r_comment comment
    from {{source('src','regions')}}
)
select * from region