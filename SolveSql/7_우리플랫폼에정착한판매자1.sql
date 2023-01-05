-- 자세한 설명 notion
select seller_id, count(distinct order_id) as orders
from olist_order_items_dataset
group by seller_id
having count(distinct order_id) >= 100;