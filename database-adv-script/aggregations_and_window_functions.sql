-- =============================================
--      Aggregations and Window Functions 
-- =============================================


-- =============================================
-- a query to find the total number of bookings
-- made by each user, using the COUNT function
-- and GROUP BY clause.
-- =============================================

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) as total_bookings
FROM 
    users u
JOIN
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id,u.first_name,u.last_name
ORDER BY
    total_bookings DESC;

--  ============================================
--  a window function (ROW_NUMBER, RANK) to rank
--  properties based on the total number of
--  bookings they have received.
--  ============================================

SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    booking_rank;


