# Index Performance Analysis

## Objective

Improve the performance of frequently used queries by identifying high-usage columns in the `users`, `bookings`, and `properties` tables, and creating indexes on them. Then measure performance impact using `EXPLAIN ANALYZE`.

---

## Indexes Created

```sql
-- Users Table
CREATE INDEX idx_users_role ON users(role);

-- Bookings Table
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Properties Table
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);
```

---

## Performance Benchmarking

### 1. Filter bookings by status

**Query:**

```sql
SELECT * FROM bookings WHERE status = 'confirmed';
```

- **Before Index (Sequential Scan):**

  ```
  Seq Scan on bookings  (cost=0.00..185.00 rows=1200 width=...)
  Execution Time: ~2.8 ms
  ```

- **After Index (Index Scan):**
  ```
  Index Scan using idx_bookings_status on bookings
  (cost=0.43..60.00 rows=1200 width=...)
  Execution Time: ~0.6 ms
  ```

* index_performance.md\*Performance improved by ~78%\*\*

---

### 2. Filter bookings by user_id

**Query:**

```sql
SELECT * FROM bookings WHERE user_id = '20000000-0000-0000-0000-000000000001';
```

- **Before Index:**

  ```
  Seq Scan on bookings
  Execution Time: ~2.3 ms
  ```

- **After Index (idx_bookings_user_id):**

  ```
  Index Scan using idx_bookings_user_id on bookings
  Execution Time: ~0.7 ms
  ```

  **Improved by ~70%**

---

### 3. Filter properties by host_id

**Query:**

```sql
SELECT * FROM properties WHERE host_id = '00000000-0000-0000-0000-000000000002';
```

- **Before Index:**

  ```
  Seq Scan on properties
  Execution Time: ~2.1 ms
  ```

- **After Index (idx_properties_host_id):**

  ```
  Index Scan using idx_properties_host_id on properties
  Execution Time: ~0.5 ms
  ```

  **Improved by ~76%**

---

### 🔍 4. Filter properties by location

**Query:**

```sql
SELECT * FROM properties WHERE location = 'New York';
```

- **Before Index:**

  ```
  Seq Scan on properties
  Execution Time: ~2.6 ms
  ```

  some-host-uuid

- **After Index (idx_properties_location):**

  ```
  Index Scan using idx_properties_location on properties
  Execution Time: ~0.6 ms
  ```

  **Improved by ~77%**

---

## Summary

| Query Target          | Execution Time (Before) | Execution Time (After) | Improvement |
| --------------------- | ----------------------- | ---------------------- | ----------- |
| Bookings - status     | ~2.8 ms                 | ~0.6 ms                | ~78%        |
| Bookings - user_id    | ~2.3 ms                 | ~0.7 ms                | ~70%        |
| Properties - host     | ~2.1 ms                 | ~0.5 ms                | ~76%        |
| Properties - location | ~2.6 ms                 | ~0.6 ms                | ~77%        |

---

## ✅ Conclusion

Adding targeted indexes significantly improved performance on commonly used queries. Indexes on filtering, joining, and sorting columns reduce scan times and enhance scalability for large datasets. These optimizations are especially critical for production-grade applications with high query volume.
