-- Users table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User measurements (ideal fits)
CREATE TABLE user_ideal_fits (
    fit_id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    category VARCHAR(50) NOT NULL, -- 'tops', 'bottoms', etc.
    measurement_type VARCHAR(50) NOT NULL, -- 'chest', 'waist', 'inseam', etc.
    measurement_value DECIMAL(5,2) NOT NULL,
    confidence_score DECIMAL(3,2) DEFAULT 1.00,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
    product_id UUID PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    department VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Product measurements
CREATE TABLE product_measurements (
    measurement_id UUID PRIMARY KEY,
    product_id UUID REFERENCES products(product_id),
    size VARCHAR(20) NOT NULL,
    measurement_type VARCHAR(50) NOT NULL,
    measurement_value DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User try-on history
CREATE TABLE try_on_history (
    try_on_id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    product_id UUID REFERENCES products(product_id),
    size VARCHAR(20) NOT NULL,
    fit_feedback VARCHAR(50) NOT NULL, -- 'too_tight', 'too_loose', etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 