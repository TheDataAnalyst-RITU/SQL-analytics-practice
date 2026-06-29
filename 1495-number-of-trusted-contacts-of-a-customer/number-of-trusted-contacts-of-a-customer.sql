# Write your MySQL query statement below
SELECT i.invoice_id,
       c.customer_name,
       i.price,
       COUNT(ct.contact_email) contacts_cnt,
       COUNT(c2.customer_id) trusted_contacts_cnt
FROM Invoices i
JOIN Customers c
  ON i.user_id = c.customer_id
LEFT JOIN Contacts ct
  ON i.user_id = ct.user_id
LEFT JOIN Customers c2
  ON ct.contact_email = c2.email
GROUP BY i.invoice_id, c.customer_name, i.price
ORDER BY i.invoice_id;