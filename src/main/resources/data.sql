-- =========================
-- USERS
-- =========================
INSERT IGNORE INTO users (user_id, location, username, phone, email, password_hash, status, role)
VALUES
(1, '서울 강남구', 'tom', '010-1111-2222', 'tom@test.com', 'hashed_pw_1', 'active', 'user'),
(2, '서울 마포구', 'alice', '010-3333-4444', 'alice@test.com', 'hashed_pw_2', 'active', 'user');

-- =========================
-- OWNER
-- =========================
INSERT IGNORE INTO owner (owner_id, owner_name, owner_email, owner_phone, password_hash)
VALUES
(1, '사장님A', 'owner1@test.com', '010-9999-8888', 'owner_pw_1');

-- =========================
-- STORE
-- =========================
INSERT IGNORE INTO store (store_id, owner_id, store_name, store_location, latitude, longitude, phone)
VALUES
(1, 1, '맛있는 치킨', '서울 강남구 테헤란로', 37.498095, 127.027610, '02-123-4567');

-- =========================
-- CATEGORY
-- =========================
INSERT IGNORE INTO category (category_id, category_name)
VALUES
(1, '치킨'),
(2, '사이드');

-- =========================
-- MENU
-- =========================
INSERT IGNORE INTO menu (menu_id, store_id, category_id, name, description, price)
VALUES
(1, 1, 1, '후라이드 치킨', '바삭한 후라이드 치킨', 18000),
(2, 1, 1, '양념 치킨', '달콤한 양념 치킨', 19000),
(3, 1, 2, '치즈볼', '고소한 치즈볼', 5000);

-- =========================
-- STOCK
-- =========================
INSERT IGNORE INTO stock (stock_id, menu_id, stock_count)
VALUES
(1, 1, 50),
(2, 2, 50),
(3, 3, 100);

-- =========================
-- USER ADDRESS
-- =========================
INSERT IGNORE INTO user_address (
    address_id, user_id, address_name, road_address, detail_address,
    latitude, longitude, is_default
)
VALUES
(1, 1, '집', '서울 강남구 테헤란로 123', '101동 202호', 37.498095, 127.027610, TRUE),
(2, 1, '회사', '서울 강남구 삼성로 77', '10층', 37.508095, 127.037610, FALSE);

-- =========================
-- ORDERS
-- =========================
INSERT IGNORE INTO orders (
    order_id, user_id, store_id, order_status,
    payment_status, payment_method, total_price, comment
)
VALUES
(1, 1, 1, 'pending', 'paid', 'card', 23000, '문 앞에 놔주세요');

-- =========================
-- ORDER ITEM
-- =========================
INSERT IGNORE INTO order_item (
    order_item_id, order_id, menu_id, quantity, price
)
VALUES
(1, 1, 1, 1, 18000),
(2, 1, 3, 1, 5000);

-- =========================
-- DELIVERY RIDER
-- =========================
INSERT IGNORE INTO delivery_rider (
    rider_id, rider_name, phone, vehicle_type, status,
    location_lat, location_lng
)
VALUES
(1, '라이더김', '010-7777-6666', 'bike', 'active', 37.495000, 127.025000);

-- =========================
-- DELIVERY ASSIGNMENT
-- =========================
INSERT IGNORE INTO delivery_assignment (
    assignment_id, order_id, rider_id, status, assigned_at
)
VALUES
(1, 1, 1, 'assigned', NOW());

-- =========================
-- DELIVERY STATUS HISTORY
-- =========================
INSERT IGNORE INTO delivery_status_history (
    history_id, order_id, status, description
)
VALUES
(1, 1, 'received', '주문이 접수되었습니다');

-- =========================
-- DELIVERY ETA
-- =========================
INSERT IGNORE INTO delivery_eta (
    eta_id, order_id, estimated_pickup_time, estimated_arrival_time, source
)
VALUES
(1, 1, DATE_ADD(NOW(), INTERVAL 15 MINUTE), DATE_ADD(NOW(), INTERVAL 35 MINUTE), 'system');

-- =========================
-- STORE COOKING STATUS
-- =========================
INSERT IGNORE INTO store_cooking_status (
    cooking_id, order_id, store_id, status
)
VALUES
(1, 1, 1, 'cooking');
