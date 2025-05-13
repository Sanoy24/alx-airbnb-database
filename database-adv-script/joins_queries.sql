-- ===============================
--        - INNER JOIN -
-- ===============================


SELECT * FROM bookings INNER JOIN users USING(user_id)

SELECT * FROM properties LEFT JOIN reviews USING(property_id)

SELECT * FROM users FULL OUTER JOIN bookings USING(user_id)
