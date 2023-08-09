use dannys_diner;

#What is the total amount each customer spent at the restaurant?

select s.custome_id, 
       sum(m.price) as total_price
 from   menu m 
 join sales s
 on m.product_id = s.product_id
 group by custome_id;
 
 #How many days has each customer visited the restaurant?
 
 select  custome_id ,
         count(order_date) as visit_day
  from sales
  group by custome_id;
  
  # What was the first item from the menu purchased by each customer?
  select s.custome_id,
         m.product_name as first_purchased_item
   from sales s 
   join menu m on m.product_id= s.product_id
   where s.order_date = (
   select  min(order_date)
   from sales
  where custome_id = s.custome_id
   );
      
#What is the most purchased item on the menu and how many times was it purchased by all customers?
select  m.product_name as most_purchased_item,
       count(s.product_id ) as count_purchased
    from sales  s
    join menu m on m.product_id = s.product_id
    group by m.product_name 
    order by count_purchased desc
    limit 1 ;
# Which item was the most popular for each customer?   
select custome_id, 
        max(product_id) as most_popular
   from sales 
   group by custome_id;
#Which item was purchased first by the customer after they became a member?
select m.custome_id,
       men.product_name as first_item_after_membership
 from  members m
 join sales s on
 m.custome_id = s.custome_id   
 join menu men on
 men.prodcut_id = s.product_id
 where s.order_date >= m.join_date
 group  by m.custom_id ;
 
 /* not finished yet*/
 #  What is the total items and amount spent for each member before they became a member?
 select mem.custome_id,
        count(s.product_id) as Total_no_of_item,
        sum(m.price) as total_spent 
 from  members mem
 join sales s on
 mem.custome_id = s.custome_id   
 join menu m on
 m.prodcut_id = s.product_id
 where s.order_date < mem.join_date
 group  by mem.custome_id ;
	    
       
       
       
	
        
   
		
      
         
       
         
         
         
         
         
         
         
         
  