CREATE TABLE customer (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  address VARCHAR(255) NULL,
  PRIMARY KEY (id));
  
  CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));
  
  CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
CREATE TABLE staff (
  id VARCHAR(10) NOT NULL,
  username VARCHAR(45) NOT NULL,
  name VARCHAR(30) NOT NULL,
  date_of_birth VARCHAR(30) NOT NULL,
  gender VARCHAR(7) NOT NULL,
  address VARCHAR(80) NOT NULL,
  email VARCHAR(30) NOT NULL,
  phone_number VARCHAR(10) NOT NULL,
  PRIMARY KEY (id));
  
CREATE TABLE product (
  id VARCHAR(10) NOT NULL,
  name VARCHAR(45) NOT NULL,
  price VARCHAR(5) NOT NULL,
  img_source VARCHAR(70) NOT NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id));
  
  
INSERT INTO users(username,password,enabled)
VALUES ('admin','{noop}123456', true);
INSERT INTO users(username,password,enabled)
VALUES ('user','{noop}password', true);
INSERT INTO users(username,password,enabled)
VALUES ('lhbach','{noop}111222', true);
INSERT INTO users(username,password,enabled)
VALUES ('lmanh','{noop}111222', true);
INSERT INTO users(username,password,enabled)
VALUES ('hcloi','{noop}loiadmin', true);


INSERT INTO user_roles (username, role)
VALUES ('admin', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('hcloi', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('hcloi', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('user', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('lhbach', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('lmanh', 'ROLE_USER');

INSERT INTO staff (id, username, name, date_of_birth, gender, address, email, phone_number)
VALUES ('1412122','hcloi', 'Huynh Cong Loi', 'January 12, 1996', 'Male', 'Binh Thanh District, HCM City', 'congloiVT@gmail.com', '0123456789');
INSERT INTO staff (id, username, name, date_of_birth, gender, address, email, phone_number)
VALUES ('1412033','lhbach', 'Le Huu Bach', 'June 04, 1996', 'Male', 'District 5, HCM City', 'bachle96@gmail.com', '097664532');
INSERT INTO staff (id, username, name, date_of_birth, gender, address, email, phone_number)
VALUES ('1412006','lmanh', 'Le My Anh', 'October 25, 1996', 'Female', 'District 3, HCM City', 'anhle1996@gmail.com', '0123657213');

INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd001','Xuc Xich', '2', '/resources/images/food/xucxich.jpg', 'Available');
INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd002','Khoai Tay Chien', '1', '/resources/images/food/khoaitaychien.png', 'Available');
INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd003','Ga Ran', '3', '/resources/images/food/garan.png', 'Available');
INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd004','Banh Bao', '1', '/resources/images/food/banhbao.png', 'Available');
INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd005','Bun Thit Nuong', '2', '/resources/images/food/bunthitnuong.png', 'Available');
INSERT INTO product (id, name, price, img_source, status)
VALUES ('pd006','Com Chien', '2', '/resources/images/food/comchien.png', 'Available');



