-- Table schemas
CREATE TABLE categories (
    category_id smallint(5) unsigned NOT NULL auto_increment PRIMARY KEY,
    name varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;


CREATE TABLE inventory_category_map (
    item_id mediumint(8) unsigned NOT NULL,
    category_id smallint(5) unsigned NOT NULL,
    PRIMARY KEY (item_id, category_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;


CREATE TABLE inventory (
    item_id mediumint(8) unsigned NOT NULL auto_increment PRIMARY KEY,
    description text NOT NULL,
    status enum('lost', 'retrieved') NOT NULL DEFAULT 'lost',
    date_created timestamp NOT NULL default NOW(),
    date_found date NOT NULL,
    date_retrieved date NULL DEFAULT NULL,
    added_by_user mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;


CREATE TABLE retrieval_records (
    retrieval_id mediumint(8) unsigned NOT NULL auto_increment PRIMARY KEY,
    item_id mediumint(8) unsigned NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50),
    phone varchar(10),
    identification varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;


CREATE TABLE users (
    user_id mediumint(8) unsigned NOT NULL auto_increment PRIMARY KEY,
    email varchar(50) NOT NULL,
    passwd varchar(100),
    role enum('admin', 'user') NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    time_registered timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  COLLATE=utf8_unicode_ci;


-- Indexes
CREATE          INDEX inventory_date_found     ON inventory (date_found);
CREATE          INDEX inventory_date_retrieved ON inventory (date_retrieved);
CREATE          INDEX inventory_added_by_user  ON inventory (added_by_user);
CREATE FULLTEXT INDEX inventory_description    ON inventory (description);


-- Foreign key constraints
ALTER TABLE retrieval_records      ADD CONSTRAINT retrieval_records_item_id_fkey          FOREIGN KEY (item_id)       REFERENCES inventory  (item_id)     ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE inventory_category_map ADD CONSTRAINT inventory_category_map_item_id_fkey     FOREIGN KEY (item_id)       REFERENCES inventory  (item_id)     ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE inventory_category_map ADD CONSTRAINT inventory_category_map_category_id_fkey FOREIGN KEY (category_id)   REFERENCES categories (category_id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE inventory              ADD CONSTRAINT inventory_added_by_user_fkey            FOREIGN KEY (added_by_user) REFERENCES users      (user_id)     ON DELETE NO ACTION ON UPDATE NO ACTION;
