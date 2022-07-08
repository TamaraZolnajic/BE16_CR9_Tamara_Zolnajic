--company names merged with product names
SELECT company.company_name, product.product_name FROM company INNER JOIN famazon on company.company_id = famazon.fk_company_id INNER JOIN product on famazon.fk_product_id = product.product_id;

--company "Schmitt" product name
SELECT product.* FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN company on famazon.fk_company_id = company.company_id WHERE company_name = "Schmitt";

--company "TicTac" product number
SELECT COUNT(product_id) FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN company on famazon.fk_company_id = company.company_id WHERE company_name = "TicTac";

--Who purchased something on a specific date
SELECT customer.last_name, customer.first_name, customer.customer_id FROM customer INNER JOIN `ordering` on customer.fk_order_id = `ordering`.`order_id` WHERE `ordering`.order_date = "2022-07-07";

--what  products were sent between this and that date 
SELECT product.*, `ordering`.`shipping_date` FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer ON famazon.fk_customer_id = customer.customer_id INNER JOIN `ordering` on customer.fk_order_id = `ordering`.order_id WHERE `ordering`.shipping_date BETWEEN "2022-07-03" and "2022-07-08";

--how many products were sent to Vienna 
SELECT COUNT(product_id) FROM product inner JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer on famazon.fk_customer_id = customer.customer_id INNER JOIN `ordering` on customer.fk_order_id = `ordering`.`order_id` INNER JOIN shiping on `ordering`.`fk_shipping_id` = shiping.shipping_id WHERE shiping.to_location = "Vienna";

--BONUS

SELECT product.product_name, product.product_price, `ordering`.`order_date`, `ordering`.`delivery_date`, shiping.to_location FROM product INNER JOIN famazon ON product.product_id = famazon.fk_product_id INNER JOIN customer on famazon.fk_customer_id = customer.customer_id INNER JOIN `ordering` on customer.fk_order_id = `ordering`.`order_id` INNER JOIN shiping on `ordering`.fk_shipping_id = shiping.shipping_id WHERE shiping.to_location = "Vienna";

SELECT product.product_name, product.product_price, `ordering`.`order_date`, `ordering`.`delivery_date`, shiping.to_location FROM product LEFT JOIN famazon ON product.product_id = famazon.fk_product_id LEFT JOIN customer on famazon.fk_customer_id = customer.customer_id LEFT JOIN `ordering` on customer.fk_order_id = `ordering`.`order_id` LEFT JOIN shiping on `ordering`.`fk_shipping_id` = shiping.shipping_id;

SELECT product.product_name, product.product_price, `ordering`.`order_date`, `ordering`.`delivery_date`, shiping.to_location FROM product RIGHT JOIN famazon ON product.product_id = famazon.fk_product_id RIGHT JOIN customer on famazon.fk_customer_id = customer.customer_id RIGHT JOIN `ordering` on customer.fk_order_id = `ordering`.`order_id` RIGHT JOIN shiping on `ordering`.`fk_shipping_id` = shiping.shipping_id WHERE shiping.to_location = "Vienna";