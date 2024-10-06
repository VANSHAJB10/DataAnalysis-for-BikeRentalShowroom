1.
select category, COUNT(model) as number_of_bikes
from bike
GROUP by category
having COUNT(model)  > 2;





2.
SELECT c.name as customer_name, c.id, COUNT(m.membership_type_id) as membership_count
FROM customer c LEFT JOIN
membership m 
ON c.id = m.customer_id
GROUP BY c.id
ORDER BY COUNT(M.id) DESC;




3.
SELECT id, category, price_per_hour as old_price_per_hour, 
	ROUND( 
      CASE
      	WHEN bike.category = 'electric' then bike.price_per_hour * 0.90
      	WHEN bike.category = 'mountain bike' then bike.price_per_hour * 0.80
      	ELSE bike.price_per_hour * 0.50
      END
    ,2) AS discounted_price_per_hour,
    
    price_per_day,
    
    ROUND(  
      CASE
      	WHEN bike.category = 'electric' then bike.price_per_day * 0.80
      	WHEN bike.category = 'mountain bike' then bike.price_per_day * 0.50
      	ELSE bike.price_per_day * 0.50
      END
    ,2) AS discounted_price_per_day
    
FROM bike;




4.
SELECT 
    category,
    COUNT(CASE WHEN status = 'available' THEN 1 END) AS available_bikes_count,
    COUNT(CASE WHEN status = 'rented' THEN 1 END) AS rented_bikes_count
FROM 
    bike
GROUP BY 
    category;




5.
select EXTRACT(YEAR from start_timestamp) as YR,
EXTRACT(month from start_timestamp) as MNTH,
SUM(total_paid) as revenue
from rental
GROUP BY YR, MNTH

UNION ALL

select EXTRACT(YEAR from start_timestamp) as YR,
null as MNTH,
SUM(total_paid) as revenue
from rental
GROUP BY YR

UNION ALL

select null as YR, null as MNTH,
SUM(total_paid) as revenue
from rental
ORDER BY YR, MNTH;


/* Better approach */


select EXTRACT(YEAR from start_timestamp) as YR,
EXTRACT(month from start_timestamp) as MNTH,
SUM(total_paid) as revenue
from rental
GROUP BY GROUPING sets ( (YR, MNTH), (YR), () )
Order by YR,MNTH;





6.
SELECT Extract(Year from start_date) as Yr,
EXTRACT(month from start_date) as Mnth,
mt.name as membership_type_name,
SUM(total_paid) as total_revenue

FROM membership m 
	JOIN
	membership_type mt
		ON mt.id = m.id
GROUP BY Yr,Mnth, membership_type_name;




7.
SELECT mt.name as membership_type_name, 
	   Extract (month from m.start_date) as mnth, 
       sum(total_paid) as total_revenue
       
FROM membership_type mt 
	 LEFT JOIN
	 membership m
    	ON mt.id = m.membership_type_id
GROUP BY mnth, membership_type_name;


/* 
USING JOIN - only matching records willbe displayed and the subtotal of each membership_type_name will not be displayed
But using LEFT Join on membership_type table we can get subtotals of each type of membership as well */


7.0
Select 
	--  mt.name as membership_type_name, 
		CASE 
        	WHEN mt.name IS NULL THEN CONCAT('Subtotal for month = ', EXTRACT(MONTH FROM start_date))
        	ELSE mt.name
    	END AS membership_type_name,
        
		extract(month from start_date) as month,
		sum(total_paid) as total_revenue
            
from membership_type mt
	join 
    membership m	
    	On mt.id = m.membership_type_id
    

where 
	extract(year from start_date) = 2023
group by 
	CUBE(mt.name, month)
    
order by mt.name, month;





8.
with cte as 
    (select customer_id, count(1),
     case when count(1) > 10 then 'more than 10' 
           when count(1) between 5 and 10 then 'between 5 and 10'
           else 'fewer than 5'
      end as category
     
    from rental
    GROUP by customer_id)
    
select category as rental_count_category,
	   count(*) as customer_count
from cte 
group by category
order by customer_count;
