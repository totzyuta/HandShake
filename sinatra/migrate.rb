# encoding: utf-8
require 'mysql'

db = Mysql::connect('localhost', ENV['DB_HANDSHAKE'] , ENV['DB_HANDSHAKE_PASS'],'handshake')

#SQL
db.query 'use handshake'

p sql = 'show tables'
rs = db.query sql
rs.each{|colmuns|
  puts colmuns.join("\t")
  db.query 'drop table '+colmuns[0]
}

db.query 'create table user(
  user_id int not null auto_increment primary key,
  family_name varchar(10),
  first_name varchar(10),
  sex tinyint,
  mail varchar(100),
  photo varchar(255),
  created_at datetime,
  modified_at datetime)'

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
