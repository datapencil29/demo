SELECT
  o.id AS order_id,
  o.order_date,
  o.status AS order_status,
  c.id AS customer_id,
  c.name AS customer_name,
  c.email AS customer_email,
  oi.id AS order_item_id,
  oi.quantity,
  oi.unit_price,
  p.id AS product_id,
  p.name AS product_name,
  p.sku AS product_sku,
  (oi.quantity * oi.unit_price) AS line_total
FROM orders AS o
JOIN customers AS c
  ON c.id = o.customer_id
JOIN order_items AS oi
  ON oi.order_id = o.id
JOIN products AS p
  ON p.id = oi.product_id
ORDER BY o.order_date DESC, o.id, oi.id;
