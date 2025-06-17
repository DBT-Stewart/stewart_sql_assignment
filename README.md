# stewart_sql_assignment

This repository contains five SQL tasks performed on different datasets. Each task includes table creation, data insertion, and queries involving aggregation, transformation, and window functions. Below is a detailed breakdown of the actions and objectives for each task.

---

## Task 1: Ecommerce Database

### Tables Involved:
| Table Name              | Description                              |
|-------------------------|------------------------------------------|
| `users`                | Stores user information                  |
| `gold_member_users`    | Subset of users with gold membership     |
| `sales`                | Records of product purchases             |
| `product`              | Product catalog                          |

### Actions Performed:
- Created and populated four tables.
- Displayed metadata (table names and contents).
- Counted total records from each table using `UNION ALL`.
- Calculated total spending per user.
- Extracted distinct visit dates for each customer.
- Identified first product purchased by each user using `ROW_NUMBER()`.
- Found most purchased item per user with count.
- Retrieved users who are not gold members.
- Calculated spend while user was a gold member.
- Filtered users whose names start with 'M'.
- Fetched distinct user IDs.
- Renamed column `price` to `price_value`.
- Updated product name from "Ipad" to "Iphone".
- Renamed table to `gold_membership_users`.
- Added and updated a `Status` column indicating gold membership.
- Performed `DELETE` and `ROLLBACK` transactions on user records.
- Inserted a duplicate product and detected duplicates using `GROUP BY`.

---

## Task 2: Product Details Summary

### Table:
| Table Name       | Description                |
|------------------|----------------------------|
| `product_details`| Stores daily sold products |

### Actions Performed:
- Created and populated product sales data.
- Queried number of products sold per date.
- Used `STRING_AGG` to list products sold each day in a single row.

---

## Task 3: Department Salary Aggregation

### Table:
| Table Name    | Description                            |
|---------------|----------------------------------------|
| `dept_tbl`    | Employee salary data with dept codes   |

### Actions Performed:
- Created and inserted sample employee salary data.
- Extracted department names by splitting on `-` using `RIGHT` and `CHARINDEX`.
- Aggregated total salary by department.

---

## Task 4: Email Signup Analytics

### Table:
| Table Name     | Description                          |
|----------------|--------------------------------------|
| `email_signup` | Stores user email IDs and sign-up dates |

### Actions Performed:
- Created and inserted sample email data.
- Queried count, latest, and earliest Gmail sign-ups.
- Calculated date difference between earliest and latest Gmail signup.
- Handled `NULL` values in signup dates by replacing them with `1970-01-01`.

---

## Task 5: Sales Data Analysis Using Window Functions

### Table:
| Table Name   | Description                        |
|--------------|------------------------------------|
| `sales_data` | Daily product-wise quantity sold   |

### Actions Performed:
- Created and inserted sales records.
- Ranked sales by product using `RANK()` to find latest sale date.
- Compared quantities sold day-over-day using `LAG()`.
- Retrieved first and last quantity sold per product using `FIRST_VALUE()` and `LAST_VALUE()`.

---
