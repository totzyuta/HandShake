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
  sex tinyint,
  mail varchar(100),
  photo varchar(255),
  created_at datetime,
  modified_at datetime)'

db.query 'create table friends(
    user_id int,
    friend_id int
  )'

db.query 'create table approaches (
  approach_id int not null auto_increment primary key,
  user_id int,
  target_id int,
  handle varchar(30),
  point varchar(50),
  manifest varchar(50),
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

#test data
useradd('TANAKA',1,'example@mail.com','');
useradd('SATOU',1,'example@mail.com','');
useradd('SUZUKI',0,'example@mail.com','');
useradd('MIYANAGA',0,'example@mail.com','');

friendadd(1,2)
friendadd(1,3)
friendadd(1,4)
friendadd(2,3)
friendadd(2,4)
friendadd(3,4)
friendadd(4,2)
friendadd(4,3)

p userget(3)

friendget(1).each do |i|
  p i
end

iloveyou(1,3,"","","")
p gettarget(1)
p getlover(3)

#Questions
questionadd("好きな食べ物は？")
questionadd("好きな場所は？")
questionadd("明日世界が滅びるなら何をする？")
questionadd("よく読む本はどんなジャンル？")
questionadd("先週の日曜日は何をしてた？")
questionadd("よく使うスマホアプリは？")
questionadd("スポーツしてる？")
questionadd("好きな素数は？")
questionadd("ペットは飼ってる？")

conversationadd(1,1)
p conversationget(1)
conversationup(1,"ショートケーキの上のいちご")
p conversationget(1)

#user test Data
=begin
puts "= user table test data insert ="
1.times{|i|
  sql = 'insert into user values(
    NULL ,'+
    (261606986+i).to_s+' ,"
    test'+i.to_s+'", "
    user'+i.to_s+'","")'
  db.query sql
}

#show
rs = db.query 'select * from user'
rs.each{|colmuns|
  puts colmuns.join("\t")
}
=end
