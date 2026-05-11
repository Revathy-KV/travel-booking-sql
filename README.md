# travel-booking-sql
A relational database project for a travel booking system built with MySQL — includes customers, destinations, bookings, and payments with JOIN queries and subqueries.

# Travel Booking System — SQL Database Project

A relational database project built with MySQL that models a complete travel booking workflow, including customer management, destinations, bookings, and payments.

---

## Database Schema

| Table | Description |
|---|---|
| `Customers3` | Stores customer details (name, email, phone, city) |
| `Destinations3` | Travel destinations with country and pricing |
| `Bookings3` | Links customers to destinations with travel dates |
| `Payments3` | Payment records linked to bookings |

### Entity Relationship

```
Customers3 ──< Bookings3 >── Destinations3
                   |
               Payments3
```

---

## SQL Queries Included

- **JOIN query** — fetch customer name, destination, and travel date across 3 tables
- **SUM + GROUP BY** — total amount paid per customer
- **Subquery** — find the most expensive destination
- **Filtered JOIN** — customers travelling after a specific date
- **LEFT JOIN + COUNT** — total bookings per destination

---

## Sample Data

**Customers:** Rahul Sharma (Delhi), Anita Verma (Mumbai), Kiran Rao (Hyderabad)

**Destinations:**
| Destination | Country | Price |
|---|---|---|
| Goa Beach | India | ₹15,000 |
| Paris Tour | France | ₹1,20,000 |
| Dubai Trip | UAE | ₹80,000 |

---

## How to Run

1. Open MySQL Workbench or any MySQL client
2. Run `travel_booking.sql` to create tables and insert data
3. Execute the SELECT queries at the bottom to see results

```sql
-- Example: who is travelling and where?
SELECT C.name, D.destination_name, B.travel_date
FROM Customers3 C
JOIN Bookings3 B ON C.customer_id = B.customer_id
JOIN Destinations3 D ON B.destination_id = D.destination_id;
```

---

## Tech Stack

- MySQL 8+
- SQL concepts used: DDL, DML, JOINs, subqueries, GROUP BY, aggregate functions, foreign keys

---

## Author

Your Name — Revathy KV

