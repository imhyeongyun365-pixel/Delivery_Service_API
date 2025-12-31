-- =========================
-- USERS
-- =========================
CREATE TABLE IF NOT EXISTS users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    role VARCHAR(20) NOT NULL DEFAULT 'user',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================
-- OWNER
-- =========================
CREATE TABLE IF NOT EXISTS owner (
    owner_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(255) NOT NULL,
    owner_email VARCHAR(255) NOT NULL,
    owner_phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================
-- STORE
-- =========================
CREATE TABLE IF NOT EXISTS store (
    store_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    owner_id BIGINT NOT NULL,
    regist_number VARCHAR(100),
    store_name VARCHAR(255) NOT NULL,
    store_location VARCHAR(255),
    latitude DOUBLE,
    longitude DOUBLE,
    phone VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_store_owner
        FOREIGN KEY (owner_id)
        REFERENCES owner(owner_id)
);

-- =========================
-- CATEGORY
-- =========================
CREATE TABLE IF NOT EXISTS category (
    category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- =========================
-- MENU
-- =========================
CREATE TABLE IF NOT EXISTS menu (
    menu_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    store_id BIGINT NOT NULL,
    category_id BIGINT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    price INT NOT NULL,
    CONSTRAINT fk_menu_store
        FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_menu_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

-- =========================
-- STOCK
-- =========================
CREATE TABLE IF NOT EXISTS stock (
    stock_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    menu_id BIGINT NOT NULL,
    stock_count INT NOT NULL,
    CONSTRAINT fk_stock_menu
        FOREIGN KEY (menu_id)
        REFERENCES menu(menu_id)
);

-- =========================
-- ORDERS
-- =========================
CREATE TABLE IF NOT EXISTS orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    store_id BIGINT NOT NULL,
    order_status VARCHAR(20) NOT NULL DEFAULT 'pending',
    payment_status VARCHAR(20) NOT NULL DEFAULT 'paid',
    payment_method VARCHAR(50),
    total_price INT NOT NULL,
    comment VARCHAR(500),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_orders_store
        FOREIGN KEY (store_id)
        REFERENCES store(store_id)
);

-- =========================
-- ORDER ITEM
-- =========================
CREATE TABLE IF NOT EXISTS order_item (
    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    CONSTRAINT fk_order_item_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_item_menu
        FOREIGN KEY (menu_id)
        REFERENCES menu(menu_id)
);

-- =========================
-- USER ADDRESS
-- =========================
CREATE TABLE IF NOT EXISTS user_address (
    address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    address_name VARCHAR(50) NOT NULL,
    road_address VARCHAR(255) NOT NULL,
    detail_address VARCHAR(255),
    latitude DECIMAL(10,7) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_address_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
);

-- =========================
-- DELIVERY RIDER
-- =========================
CREATE TABLE IF NOT EXISTS delivery_rider (
    rider_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    rider_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    vehicle_type VARCHAR(20) DEFAULT 'bike',
    status VARCHAR(20) DEFAULT 'active',
    location_lat DOUBLE,
    location_lng DOUBLE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================
-- DELIVERY ASSIGNMENT
-- =========================
CREATE TABLE IF NOT EXISTS delivery_assignment (
    assignment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    rider_id BIGINT,
    assigned_at DATETIME,
    accepted_at DATETIME,
    picked_up_at DATETIME,
    delivered_at DATETIME,
    status VARCHAR(20) NOT NULL DEFAULT 'assigned',
    CONSTRAINT fk_assignment_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_assignment_rider
        FOREIGN KEY (rider_id)
        REFERENCES delivery_rider(rider_id)
);

-- =========================
-- DELIVERY TRACKING
-- =========================
CREATE TABLE IF NOT EXISTS delivery_tracking (
    tracking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    assignment_id BIGINT NOT NULL,
    rider_id BIGINT NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
    recorded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tracking_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES delivery_assignment(assignment_id),
    CONSTRAINT fk_tracking_rider
        FOREIGN KEY (rider_id)
        REFERENCES delivery_rider(rider_id)
);

-- =========================
-- DELIVERY ETA
-- =========================
CREATE TABLE IF NOT EXISTS delivery_eta (
    eta_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    estimated_pickup_time DATETIME,
    estimated_arrival_time DATETIME,
    calculated_at DATETIME,
    source VARCHAR(20) DEFAULT 'system',
    CONSTRAINT fk_eta_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- =========================
-- DELIVERY STATUS HISTORY
-- =========================
CREATE TABLE IF NOT EXISTS delivery_status_history (
    history_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL,
    description VARCHAR(500),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_history_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- =========================
-- STORE COOKING STATUS
-- =========================
CREATE TABLE IF NOT EXISTS store_cooking_status (
    cooking_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    store_id BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_cooking_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_cooking_store
        FOREIGN KEY (store_id)
        REFERENCES store(store_id)
);
