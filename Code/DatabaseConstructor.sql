-- DatabaseConstructor.sql - database schema for ParliamentManager
-- Version: 1.0

-- drop tables
DROP TABLE if EXISTS committee CASCADE;
DROP TABLE if EXISTS report CASCADE;
DROP TABLE if EXISTS member CASCADE;
DROP TABLE if EXISTS portfolio CASCADE;
DROP TABLE if EXISTS link_comittee_member CASCADE;
DROP TABLE if EXISTS link_report_member CASCADE;

-- create enums

-- Title enum
CREATE TYPE TITLE AS ENUM(
'Mr.',
'Mrs.',
'Ms.',
'Maddam',
'Sir.',
'Dr.',
'Prof.',
'Master',
'Dame'
)

-- create tables

-- table for holding committee data
CREATE TABLE committee(
id SERIAL PRIMARY KEY,
);

-- table for holding report data
CREATE TABLE report(
id SERIAL PRIMARY KEY,
committee_id INTEGER REFERENCES committee(id),
name STRING,
url STRING
);

-- table for holding member data
CREATE TABLE member(
id SERIAL PRIMARY KEY,
name_id INTEGER REFERENCES member_name(id)
);

-- table for holding member names
CREATE TABLE member_name(
id SERIAL PRIMARY KEY,
title TITLE,
first STRING,
last STRING
);

-- table for holding portfolio data
CREATE TABLE portfolio(
id SERIAL PRIMARY KEY,

-- TODO : i am not sure what goes in this table.

);

-- create many-many linking tables

-- table for linking committees to members
CREATE TABLE link_comittee_member(
id SERIAL PRIMARY KEY,
member_id INTEGER REFERENCES member(id),
committee_id INTEGER REFERENCES committee_id
);

-- table for linking reports to members
CREATE TABLE link_report_member(
id SERIAL PRIMARY KEY,
member_id INTEGER REFERENCES member(id),
report_id INTEGER REFERENCES report(id)

);