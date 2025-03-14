
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.contraction_kpi
         as
        (with trans_cte as (
    select 
        payment_month,
        sum(revenue) as rev_per_month,
        lag(rev_per_month,1,0) over (order by   payment_month) as revenuelag
    from DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg
    group by   payment_month
),
month_cte as (
    select   
        payment_month, 
        rev_per_month,
        revenuelag 
     from trans_cte
),
final_cte as (
    select 
        payment_month, 
        rev_per_month, 
        revenuelag,
        (rev_per_month - revenuelag) as contraction_amt
    from month_cte
    where revenuelag > rev_per_month
)
select * from final_cte
        );
      
  