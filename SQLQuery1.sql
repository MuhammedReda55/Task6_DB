CREATE DATABASE Task6
USE Task6
CREATE SCHEMA schema2

CREATE TABLE schema2.actor(
 act_id INT PRIMARY KEY,
 act_fname CHAR(20),
 act_lname CHAR(20),
 act_gender CHAR(1)
)
CREATE TABLE schema2.move_cast(
 act_id INT,
 mov_id INT,
 role CHAR(30)
)

CREATE TABLE schema2.genres(
gen_id INT PRIMARY KEY,
gen_title CHAR(20) NOT NULL
)
CREATE TABLE schema2.director(
 dir_id INT PRIMARY KEY,
 dir_fname CHAR(20),
 dir_lname CHAR(20)
)
CREATE TABLE schema2.movie(
 mov_id INT  PRIMARY KEY,
 mov_title CHAR(50),
 mov_year INT,
 mov_time INT,
 mov_lang CHAR(50),
 mov_dt_rel date,
 mov_rel_country CHAR(50)
)
CREATE TABLE schema2.movie_genres(
 mov_id INT,
 gen_id INT
)
CREATE TABLE schema2.movie_direction(
 dir_id INT,
 mov_id INT
)
CREATE TABLE schema2.reviewer(
 rev_id INT PRIMARY KEY,
 rev_name CHAR(30)
)
CREATE TABLE schema2.rating(
 mov_id INT,
 rev_id INT,
 rev_stars INT,
 num_o_ratings INT
)