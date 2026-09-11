{% test order_values(model,column_name,val) %}

-- {{config(store_failures=true)}} we can give this in a yml file: stage.yml
select * from {{model}} where {{column_name}}<= {{ val }}

{% endtest %}
