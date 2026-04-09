-- Core Setup
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    location_name VARCHAR(100)
);

-- Products & Bundles
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255),
    supplier_id INT
);

CREATE TABLE bundle_items (
    bundle_id INT REFERENCES products(id),
    component_id INT REFERENCES products(id),
    quantity_needed INT
);

-- Inventory Tracking
CREATE TABLE warehouse_inventory (
    warehouse_id INT REFERENCES warehouses(id),
    product_id INT REFERENCES products(id),
    quantity INT DEFAULT 0,
    low_stock_threshold INT,
    PRIMARY KEY (warehouse_id, product_id)
);

CREATE TABLE inventory_logs (
    log_id SERIAL PRIMARY KEY,
    product_id INT,
    change_amount INT,
    action_type VARCHAR(50), -- e.g. 'sale', 'restock'
    timestamp TIMESTAMP DEFAULT NOW()
);
