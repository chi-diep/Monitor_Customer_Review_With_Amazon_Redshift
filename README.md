# Amazon Redshift Transactional Database for Monitor Products & Reviews

![Built With](https://img.shields.io/badge/Built%20With-SQL%2C%20Amazon%20Redshift-blue)  
![Language](https://img.shields.io/badge/Language-SQL-orange)  
![Status](https://img.shields.io/badge/Project%20Status-Complete-brightgreen)

---

## Why This Project Matters

In today’s digital economy, companies handle huge volumes of data from customer purchases to product reviews. I wanted to explore how Amazon Redshift, a powerful cloud-based data warehouse, can be used to build a transactional, ACID-compliant relational database that helps businesses store and analyze this data quickly and securely.

**Key question:** How to design a robust cloud database that keeps product and review data consistent, scales easily, and supports complex analytics?

By building this project, I learned how to create relational data models, enforce referential integrity, and demonstrate practical CRUD operations in a scalable environment.

---

## What Data Did I Use?

### Dataset 1: Amazon Monitor Products
Includes details like:
- Title / Description
- Brand
- Screen Size (inches)
- Resolution (FHD, 4K, etc.)
- Aspect Ratio (16:9, 21:9)
- Customer Rating (1–5)
- Price (USD)

Source: [Kaggle – Amazon Monitors](https://www.kaggle.com/datasets/durjoychandrapaul/amazon-products-sales-monitor-dataset)

---

### Dataset 2: Amazon App Reviews
Contains information such as:
- Review ID
- Username
- Review Content
- Rating (1–5)
- Like Count
- Date of Review
- App Version

Source: [Kaggle – Amazon Reviews](https://www.kaggle.com/datasets/ashishkumarak/amazon-shopping-reviews-daily-updated)

---

## How I Preprocessed the Data

- Removed special characters (Ø, ·, ") using VBA for compatibility with Redshift.
- Reduced dataset size by sampling reviews down to about 900 to match roughly 950 monitors. This created a realistic scenario where some products have multiple reviews, others none.
- Truncated long reviews to fit VARCHAR(256) constraints.
- Standardized IDs and dates to maintain data consistency (YYYY-MM-DD format).

---

## Database Design & ACID Guarantees

The database consists of:
- AmazonMonitor: stores product data.
- AmazonReview: stores reviews linked via a foreign key.

### Why This is a Transactional Design
- Atomicity: Ensures each operation (insert/update/delete) is a complete transaction.
- Consistency: Foreign key constraints maintain data integrity.
- Isolation: Redshift’s transaction management handles simultaneous inserts safely.
- Durability: Data replication ensures persistence even if cluster nodes fail.

---

## ERD & Relationship

- One-to-Many:  
  Each monitor can have zero, one, or many reviews.  
  Each review must be tied to a monitor.

This ensures that reviews cannot exist without a valid product, maintaining business rules and data integrity.

---

## Where’s the Code?

All SQL CRUD operations—including CREATE, INSERT, UPDATE, SELECT, DELETE—are in the SQL script file provided in this repository.

They show how to:
- Build tables with primary and foreign keys.
- Enforce referential integrity.
- Run transactional operations safely on Amazon Redshift.

---

## What I Learned

- How to design a normalized database on Redshift  
- The importance of ACID properties in maintaining data consistency  
- Data preprocessing to load large datasets smoothly  
- Practical skills writing SQL to support real-world business scenarios

---

## Possible Extensions

- Add triggers to automatically update average ratings on inserts or deletes.
- Use ON DELETE CASCADE for easier maintenance.
- Expand to handle more product types beyond monitors.

---

Questions or ideas?  
This was primarily for hands-on learning. I would be glad to discuss or get suggestions to improve it.
