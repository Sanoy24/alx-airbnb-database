
-- Sample Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('00000000-0000-0000-0000-000000000001', 'Alice', 'Smith', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password2', '2345678901', 'host', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Sample Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Cozy Cabin', 'A small cozy cabin in the woods.', 'Colorado', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'Modern Apartment', 'An apartment in the city center.', 'New York', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2025-06-01', '2025-06-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '2025-07-10', '2025-07-12', 400.00, 'pending', CURRENT_TIMESTAMP);

-- Sample Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 480.00, CURRENT_TIMESTAMP, 'credit_card');

-- Sample Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 5, 'Fantastic stay, very clean and quiet!', CURRENT_TIMESTAMP);

-- Sample Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Is the cabin available in July?', CURRENT_TIMESTAMP);
