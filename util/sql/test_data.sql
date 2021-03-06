START TRANSACTION;

-- Categories
INSERT INTO categories (category_id, name) VALUES
(1, "Cell Phones"),
(2, "Wallets"),
(3, "Books"),
(4, "Glasses"),
(5, "Headphones"),
(6, "Keys"),
(7, "Miscellaneous");

-- User
INSERT INTO users (user_id, email, passwd, role, first_name, last_name) VALUES
(1, 'tester@example.net', '$2a$10$NHHKb4wYP6d60sHrpVUIxudvpqyOnPAKw6J..B9PE2YYycWChHE6u', 'admin', 'Admin', 'User'); -- Password is "tester"

-- Inventory
INSERT INTO inventory (item_id, description_public, description_private, location_found, category, `status`, date_found, date_retrieved, added_by_user) VALUES
(1, 'Brown leather wallet', 'Contains ID of Robert Lattner', 'Found on the quad', 'wallet', 'lost', CURDATE(), NULL, 1),
(2, 'iPhone with light blue case', 'Lock screen says it belongs to Abbie Reily', 'Adams Library near the entrance', 'cellphone', 'retrieved', CURDATE() - INTERVAL 1 MONTH, CURDATE() - INTERVAL 1 WEEK, 1);

-- Retrieval
INSERT INTO retrieval_records (retrieval_id, item_id, first_name, last_name, email, phone, identification) VALUES
(1, 2, 'Kaitlyn', 'Somename', 'kaitlyn@example.net', '4016559815', 'RI1865497');

-- Category Map
INSERT INTO inventory_category_map (item_id, category_id) VALUES
(1, 2),
(2, 1);

-- User Codes
INSERT INTO user_hashes (user_id, `hash`, expiration_date) VALUES
(1, '27c30ca513d2651d076f74738b255a2038961bde9a1aa552e9fbacf4c71b8113', CURDATE() + INTERVAL 30 DAY);

-- Images
INSERT INTO images (item_id, `format`, is_primary) VALUES
(1, 'png', true),
(1, 'jpg', false);

COMMIT;