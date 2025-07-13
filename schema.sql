CREATE TABLE swiggy (
    delivery_person_id   INTEGER NOT NULL,
    order_id             VARCHAR(20) PRIMARY KEY,
    order_value          NUMERIC(10, 2),
    order_quantity       INTEGER,
    city                 VARCHAR(50),
    order_timestamp      TIMESTAMP,
    order_pickup_timestamp TIMESTAMP,
    delivery_timestamp   TIMESTAMP,
    order_rating         INTEGER CHECK (order_rating BETWEEN 1 AND 5)
);
