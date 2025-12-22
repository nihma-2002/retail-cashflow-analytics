-- Customers table
CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    segment TEXT,
    city TEXT,
    state TEXT,
    region TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id TEXT,
    order_date DATE,
    ship_date DATE,
    sales REAL,
    profit REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Payments table
CREATE TABLE payments (
    order_id INTEGER,
    payment_due_date DATE,
    payment_date DATE,
    payment_delay_days INTEGER,
    payment_status TEXT,
    aging_bucket TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
