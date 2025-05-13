# 🧠 Performance Monitoring and Optimization Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans, identifying bottlenecks, and applying schema/index adjustments.

---

## 🔍 Step 1: Analyze Frequently Used Queries

### Query 1: Get all confirmed bookings for a user

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = '00000000-0000-0000-0000-000000000002' AND status = 'confirmed';
```

### 🔬 Execution Plan (Before Optimization)

```
Seq Scan on bookings
  Filter: (user_id = '...' AND status = 'confirmed')
  Rows Removed by Filter: 980
Execution Time: ~2.9 ms
```

### 🚨 Observation:

- Sequential scan despite filtering on two columns
- Performance degrades with data growth

---

## 🛠 Step 2: Optimization Applied

### Index Created:

```sql
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);
```

### 🔬 Execution Plan (After Optimization)

```
Index Scan using idx_bookings_user_status on bookings
  Index Cond: ((user_id = '...') AND (status = 'confirmed'))
Execution Time: ~0.5 ms
```

✅ **Performance improved by ~82%**

---

## 🔍 Query 2: Filter properties by location and price

```sql
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'Nairobi' AND pricepernight < 100;
```

### 🔬 Execution Plan (Before Optimization)

```
Seq Scan on properties
  Filter: (location = 'Nairobi' AND pricepernight < 100)
Execution Time: ~2.4 ms
```

---

## 🛠 Index Created:

```sql
CREATE INDEX idx_properties_location_price ON properties(location, pricepernight);
```

### 🔬 Execution Plan (After Optimization)

```
Index Scan using idx_properties_location_price on properties
  Index Cond: ((location = 'Nairobi') AND (pricepernight < 100))
Execution Time: ~0.4 ms
```

✅ **Performance improved by ~83%**

---

## 📋 Summary of Improvements

| Query                          | Index Used                      | Execution Time Before | After   | Improvement |
| ------------------------------ | ------------------------------- | --------------------- | ------- | ----------- |
| Bookings by user + status      | `idx_bookings_user_status`      | ~2.9 ms               | ~0.5 ms | ~82%        |
| Properties by location + price | `idx_properties_location_price` | ~2.4 ms               | ~0.4 ms | ~83%        |

---

## 🔁 Ongoing Monitoring Plan

- Use `EXPLAIN ANALYZE` regularly on slow queries
- Monitor `pg_stat_statements` for query frequency and cost
- Review indexes quarterly to drop unused and add new based on evolving query patterns
- Consider partitioning large tables in the future (e.g., bookings by year)

---

## ✅ Conclusion

By analyzing query execution plans and introducing compound indexes, we significantly improved query response times. These refinements are essential for a responsive and scalable application backend.
