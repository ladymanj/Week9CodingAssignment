CREATE DATABASE IF NOT EXISTS users;

USE users;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int(11) NOT NULL AUTO_INCREMENT,
	username varchar(25) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE posts (
	post_id int(11) NOT NULL AUTO_INCREMENT,
	user_id int(11) NOT NULL,
	time_posted datetime DEFAULT CURRENT_TIMESTAMP,
	body varchar(255) NOT NULL,
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
	comment_id int(11) NOT NULL AUTO_INCREMENT,
	user_id int(11) NOT NULL,
	post_id int(11) NOT NULL,
	time_posted datetime DEFAULT CURRENT_TIMESTAMP,
	body varchar(255) NOT NULL,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);