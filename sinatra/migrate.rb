# encoding: utf-8
require 'mysql'
load 'db.rb'

db = Mysql::connect('localhost', ENV['DB_HANDSHAKE'] , ENV['DB_HANDSHAKE_PASS'],'handshake')

#SQL
db.query 'use handshake'

p sql = 'show tables'
rs = db.query sql
rs.each{|colmuns|
  puts colmuns.join("\t")
  db.query 'drop table '+colmuns[0]
}

db.query 'create table users(
  user_id int not null auto_increment primary key,
  name varchar(50),
  family_name varchar(10),
  first_name varchar(10),
  sex tinyint,
  mail varchar(100),
  photo varchar(255),
  created_at datetime,
  modified_at datetime)'

db.query 'create table approaches (
  approach_id int not null auto_increment primary key,
  user_id int,
  target_id int,
  approached_at datetime)'

db.query 'create table questions (
  question_id int not null auto_increment primary key,
  body text)'

db.query 'create table conversations (
  conversation_id int not null auto_increment primary key,
  approach_id int,
  question_id int,
  question_at datetime,
  answer varchar(20),
  answer_at datetime)'

#user test Data
=begin
puts "= user table test data insert ="
1.times{|i|
  sql = 'insert into user values(NULL ,'+(261606986+i).to_s+' ,"test'+i.to_s+'", "user'+i.to_s+'","")'
  db.query sql
}

#show
rs = db.query 'select * from user'
rs.each{|colmuns|
  puts colmuns.join("\t")
}
=end
