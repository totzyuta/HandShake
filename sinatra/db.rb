require 'sinatra'
require 'thin'
require 'mysql'

$db = Mysql::connect('localhost', ENV['DB_HANDSHAKE'] , ENV['DB_HANDSHAKE_PASS'], 'handshake')

def DBconsole(query)
 rs = $db.query query
 rs.each{|colmuns|
    puts colmuns.join("\t")
 }
 return rs
end

#connect
$db.query 'use handshake'
DBconsole('show tables')
