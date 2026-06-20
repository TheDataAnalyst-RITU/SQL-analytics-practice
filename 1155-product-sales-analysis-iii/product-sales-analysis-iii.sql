with cte as (
    select distinct product_id,min(year) as year
    from Sales
    group by 1
)
select product_id,year as first_year, quantity, price from Sales
where (product_id,year) in (select * from cte)