require 'sinatra'
require 'thin'
require 'mysql'
require 'date'

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

#model
def useradd(name, sex, mail, photo)
  rs = $db.query "select count(*) from users"
  id = ''
  rs.each{|col|
    id = (col[0].to_i+1).to_s
  }
  sql = 'insert into users values(' + id + ' ,"' + name + '",' + sex.to_s + ',"' + mail + '","' + photo + '",NULL,NULL)'
  $db.query sql
  return id
end

def userget(id)#, colmun)
  colmun = '*'
  sql = 'select ' + colmun + ' from users where user_id = "' + id.to_s + '"'
  rs = $db.query sql
  rs.each{|col|
    return col#.join("\t")
  }
end

def friendadd(my_id, friend_id)
  sql = 'insert into friends values(' +
    my_id.to_s + ',' +
    friend_id.to_s + ')'
  $db.query sql
end

def friendget(my_id)
  sql = 'select * from friends where user_id = "' + my_id.to_s + '"'
  rs = $db.query sql
  result = []
  rs.each{|col|
    result << col[1]#.join("\t")
  }
  return result
end

#my_id が target_idに告白する
def iloveyou(my_id, target_id, handle, point, manifest)
  sql = 'insert into approaches values(
    NULL ,' +
    my_id.to_s + ',' +
    target_id.to_s + ',"' +
    handle + '","' +
    point + '","' +
    manifest + '",' +
    'now())'
  $db.query sql
end

#approch_idを照会する
#def approchget(lover_id, target_id)
#  sql = 'select * from approaches where'
#end

#my_idが告白してる人
def gettarget(my_id)
  sql = 'select * from approaches where user_id = "' + my_id.to_s + '"'
  rs = $db.query sql
  rs.each{|col|
    return col#.join("\t")
  }
end

#my_id に告白してる人
def getlover(my_id)
  sql = 'select * from approaches where target_id = "' + my_id.to_s + '"'
  rs = $db.query sql
  rs.each{|col|
    return col#.join("\t")
  }
end

#質問集の追加
def questionadd(body)
  sql = 'insert into questions values(
    NULL ,"' +
    body + '")'
  $db.query sql
end

#質問のリストを取る
def questionget()
  sql = 'select * from questions'
  rs = $db.query sql
  result = []
  rs.each{|col|
    result << col#.join("\t")
  }
  return result
end

#質問を送る
def conversationadd(approach_id, question_id)
  sql = 'insert into conversations values(
    NULL ,' +
    approach_id.to_s + ',' +
    question_id.to_s + ',' +
    'now()' + ',NULL,NULL)'
  $db.query sql
end

#質問に答える
def conversationup(conversation_id, answer)
  sql = 'update conversations set
    answer = "' + answer + '",
    answer_at = now()
    where conversation_id = "' + conversation_id.to_s + '"'
  $db.query sql
end

#質問を照会
def conversationget(approach_id)
  sql = 'select * from conversations where approach_id = "' + approach_id.to_s + '"'
  rs = $db.query sql
  result = []
  rs.each{|col|
    reslut << col#.join("\t")
  }
  return reslut
end
