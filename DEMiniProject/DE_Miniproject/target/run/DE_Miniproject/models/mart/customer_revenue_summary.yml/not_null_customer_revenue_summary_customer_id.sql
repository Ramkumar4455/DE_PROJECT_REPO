select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from DEMINIPROJECT.TRANSFORMED_DATAS.customer_revenue_summary
where customer_id is null



      
    ) dbt_internal_test