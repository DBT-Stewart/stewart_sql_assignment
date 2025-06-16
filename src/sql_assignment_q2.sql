CREATE TABLE product_details (
    sell_date DATE,
    product VARCHAR(50)
);

drop table product_details
select * from product_details;

INSERT INTO product_details (sell_date, product)
VALUES 
('2020-05-30', 'Headphones'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Book'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');


SELECT 
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(LTRIM(RTRIM(product)), ', ') 
       WITHIN GROUP (ORDER BY product) AS product_list
FROM product_details
GROUP BY sell_date
ORDER BY sell_date;
