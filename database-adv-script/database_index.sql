-- Index on users.role for filtering by role (e.g., 'host', 'guest')
CREATE INDEX idx_users_role ON users(role);

-- Index on bookings.status for frequent status filtering
CREATE INDEX idx_bookings_status ON bookings(status);

-- Index on bookings.user_id for JOINs and filtering
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.start_date and end_date for date filtering
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Index on properties.host_id for filtering properties by host
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Index on properties.location for search queries
CREATE INDEX idx_properties_location ON properties(location);

-- Index on properties.pricepernight for sorting or range filters
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);
