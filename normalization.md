# Airbnb Database Normalization to 3NF

## Objective

Normalize the Airbnb database to eliminate redundancy, ensure data integrity, and structure data in a way that it adheres to the Third Normal Form (3NF).

---

## ✅ Step-by-Step Normalization

---

### First Normal Form (1NF)

**Goal:** Eliminate repeating groups and ensure atomic values.

All entities already use atomic attributes:

- No repeating or composite fields.
- Fields like `first_name`, `email`, `pricepernight`, etc. are indivisible.

✅ **1NF is satisfied.**

---

### Second Normal Form (2NF)

**Goal:** Eliminate partial dependencies (only applies if there are composite primary keys).

All primary keys are single-column UUIDs, so:

- No partial dependency issues.
- Each non-key attribute fully depends on the entire primary key.

✅ **2NF is satisfied.**

---

### Third Normal Form (3NF)

**Goal:** Eliminate transitive dependencies (non-key attribute depends on another non-key attribute).

#### Review Per Table:

##### User

```text
user_id → first_name, last_name, email, password_hash, phone_number, role, created_at
```

- No non-key attribute depends on another non-key.
- `email` is unique, but not derived from any other field.

✅ 3NF satisfied.

---

##### Property

```text
property_id → host_id, name, description, location, pricepernight, created_at, updated_at
```

- All attributes depend directly on the primary key.
- `host_id` is a foreign key (not derived).

✅ 3NF satisfied.

---

##### Booking

```text
booking_id → property_id, user_id, start_date, end_date, total_price, status, created_at
```

- No derived or transitive dependencies.
- `total_price` is a business-calculated value but acceptable in schema terms.

✅ 3NF satisfied.

---

##### Payment

```text
payment_id → booking_id, amount, payment_date, payment_method
```

- No transitive dependencies.
- Each field is atomic and relevant to the payment context.

✅ 3NF satisfied.

---

##### Review

```text
review_id → property_id, user_id, rating, comment, created_at
```

- No transitive dependency; all attributes depend on `review_id`.

✅ 3NF satisfied.

---

##### Message

```text
message_id → sender_id, recipient_id, message_body, sent_at
```

- Sender and recipient are clearly defined via foreign keys.
- All fields depend directly on the message ID.

✅ 3NF satisfied.

---

## No Adjustments Needed

The current schema does **not violate any normalization principles**. It is already optimized and follows the best practices of 3NF.

---

## ✅ Final Conclusion

**The Airbnb database schema is normalized to Third Normal Form (3NF)**:

- No repeating groups (1NF)
- No partial dependencies (2NF)
- No transitive dependencies (3NF)
