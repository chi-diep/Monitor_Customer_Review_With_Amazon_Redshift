
-- AmazonMonitor Table
CREATE TABLE AmazonMonitor (
    monitorID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    screen_size FLOAT NOT NULL,
    resolution VARCHAR(50) NOT NULL,
    aspect_ratio VARCHAR(10) NOT NULL,
    rating FLOAT NOT NULL,
    price FLOAT NOT NULL
);

-- Insert Statements
INSERT INTO AmazonMonitor (monitorID, description, brand, screen_size, resolution, aspect_ratio, rating, price)
VALUES (1, '27-inch Full HD monitor with IPS display', 'Dell', 27.0, '1920x1080', '16:9', 4.5, 199.99);

INSERT INTO AmazonMonitor (monitorID, description, brand, screen_size, resolution, aspect_ratio, rating, price)
VALUES (2, '32-inch 4K Ultra HD monitor', 'Samsung', 32.0, '3840x2160', '16:9', 4.7, 399.99);

-- Update Statements
UPDATE AmazonMonitor
SET price = 179.99
WHERE monitorID = 1;

UPDATE AmazonMonitor
SET rating = 4.8
WHERE monitorID = 2;

-- Select Statements
SELECT * FROM AmazonMonitor;

SELECT brand, screen_size, price
FROM AmazonMonitor
WHERE rating >= 4.5;

SELECT monitorID, description, screen_size
FROM AmazonMonitor
WHERE screen_size > 30;

SELECT monitorID, brand, screen_size, price
FROM AmazonMonitor
WHERE resolution = '1920x1080';

SELECT monitorID, description, brand, price
FROM AmazonMonitor
WHERE price BETWEEN 100 AND 300;

-- Delete Statements
DELETE FROM AmazonMonitor
WHERE monitorID = 2;

DELETE FROM AmazonMonitor
WHERE rating < 4.0;


-- AmazonReview Table
CREATE TABLE AmazonReview (
    reviewID INTEGER PRIMARY KEY NOT NULL,
    monitorID INTEGER,
    username VARCHAR(100) NOT NULL,
    review_text TEXT NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    thumbs_up_count INTEGER,
    date_of_review DATE,
    app_version VARCHAR(20),
    FOREIGN KEY (monitorID) REFERENCES AmazonMonitor(monitorID)
);

-- Insert Statements
INSERT INTO AmazonReview (reviewID, monitorID, username, review_text, rating, thumbs_up_count, date_of_review, app_version)
VALUES (101, 1, 'user123', 'Great monitor for work and gaming!', 5, 10, '2024-01-15', '1.2.3');

INSERT INTO AmazonReview (reviewID, monitorID, username, review_text, rating, thumbs_up_count, date_of_review, app_version)
VALUES (102, 2, 'tech_guru', 'Excellent 4K display with vibrant colors.', 5, 25, '2024-01-20', '1.3.0');

-- Update Statements
UPDATE AmazonReview
SET thumbs_up_count = thumbs_up_count + 1
WHERE reviewID = 101;

UPDATE AmazonReview
SET rating = 4
WHERE reviewID = 102;

-- Select Statements
SELECT * FROM AmazonReview
WHERE monitorID = 1;

SELECT username, review_text
FROM AmazonReview
WHERE rating = 5;

SELECT reviewID, monitorID, username, thumbs_up_count
FROM AmazonReview
WHERE thumbs_up_count > 20;

SELECT reviewID, monitorID, date_of_review
FROM AmazonReview
WHERE date_of_review > '2024-01-01';

SELECT r.reviewID, r.username, r.review_text, r.rating
FROM AmazonReview r
JOIN AmazonMonitor m ON r.monitorID = m.monitorID
WHERE m.resolution = '1920x1080';

-- Delete Statements
DELETE FROM AmazonReview
WHERE reviewID = 102;

DELETE FROM AmazonReview
WHERE rating = 1;
