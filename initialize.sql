DROP TABLE IF EXISTS users, user_contact, business_type, businesses, business_contact, business_address, tickets;

CREATE TABLE users (
	user_id 			INT 			NOT NULL 	AUTO_INCREMENT,
	user_name 			VARCHAR(50)		NOT NULL,
	user_password 		VARCHAR(50)		NOT NULL,
	is_deleted 			BOOL 			DEFAULT FALSE,
	PRIMARY KEY (user_id)
);

CREATE TABLE user_address (
    user_id				INT 			NOT NULL,
    user_address		VARCHAR(50)		NOT NULL,
    zipcode 			VARCHAR(5)		NOT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				VARCHAR(50)		NOT NULL,
    country				VARCHAR(50)		NOT NULL,
    FOREIGN KEY (user_id)  REFERENCES users (user_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id)
); 

CREATE TABLE user_contact (
    user_id				INT 			NOT NULL,
    email				VARCHAR(50)		NOT NULL,
    phone	 			VARCHAR(5)		NOT NULL,
    first_name			VARCHAR(50)		NOT NULL,
    last_name			VARCHAR(50)		NOT NULL,
    carrier_pidgeon		BOOL			,
    FOREIGN KEY (user_id)  REFERENCES users (user_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id)
); 

CREATE TABLE business_type (
	type_id				INT 			NOT NULL 	AUTO_INCREMENT,
    type				VARCHAR(50) 	NOT NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE businesses (
	business_id			INT 			NOT NULL 	AUTO_INCREMENT,
	business_name 		VARCHAR(50)		NOT NULL,
	business_password	VARCHAR(50)		NOT NULL,
	is_deleted 			BOOL 			DEFAULT FALSE,
	PRIMARY KEY (business_id)
);

CREATE TABLE business_address (
    business_id 		INT 			NOT NULL,
    business_address	VARCHAR(50)		NOT NULL,
    zipcode 			VARCHAR(5)		NOT NULL,
    city				VARCHAR(50)		NOT NULL,
    state				VARCHAR(50)		NOT NULL,
    country				VARCHAR(50)		NOT NULL,
    FOREIGN KEY (business_id)  REFERENCES businesses (business_id) ON DELETE CASCADE,
    PRIMARY KEY (business_id)
); 

CREATE TABLE business_contact (
    business_id 		INT 			NOT NULL,
    type_id				INT				NOT NULL,
    email				VARCHAR(50)		NOT NULL,
    phone	 			VARCHAR(5)		NOT NULL,
    business_name		VARCHAR(50)		NOT NULL,
    description			VARCHAR(50)		NOT NULL,
    FOREIGN KEY (business_id)  	REFERENCES businesses (business_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) 		REFERENCES business_type (type_id),
    PRIMARY KEY (business_id, type_id)
);

CREATE TABLE tickets (
	user_id 			INT 			NOT NULL,
    business_id 		INT 			NOT NULL,
    user_address		VARCHAR(50)		NOT NULL,
    zipcode 			VARCHAR(5)		NOT NULL,
    first_name			VARCHAR(50)		NOT NULL,
    last_name			VARCHAR(50)		NOT NULL,
    start_date   		DATE            NOT NULL,
    end_date     		DATE,
    is_active			BOOL			DEFAULT TRUE,
    FOREIGN KEY (user_id)  		REFERENCES users (user_id),
    FOREIGN KEY (business_id)  	REFERENCES businesses (business_id),
    PRIMARY KEY (user_id, business_id)
);



