# encoding: utf-8
require 'sinatra'
require 'mysql'
# require 'omniauth'
# require 'omniauth-twitter'
require 'cgi'
require 'digest/md5'
load 'db.rb'

#manage session
set :sessions, true
enable :session

#set :port, 80

#Top Page
get '/' do
  #セッションがあったら/mypageに飛ばす
  redirect '/mypage' if session['uid'] != nil
  erb :index
end

#Sign up Page
get '/regist' do
  session['uid'] = rand(10)+1
  newuser = userget(session['uid'])
  @regist_img = newuser[4]
  @regist_name = newuser[1]
  @regist_email = newuser[3]
  erb :regist
end

#My Page
get '/mypage' do
  #デバッグ用
  session['uid'] = params[:uid] if params[:uid] != nil

  #告白している方
  user = userget(session['uid'])
  @my_img = user[4]
  target = gettarget(user[0])
  begin
    #告白してる
    @target_img = userget(target[2])[4]
  rescue
    #告白してない
    @target_img = ""
  end

  #進捗計算

  #残り計算

  #告白されている方
  lover = getlover(user[0])
  begin
    #告白されてる
    @lover_img = userget(lover[1])[4]
  rescue
    #告白されてない
    @lover_img = ""
  end

  #進捗計算

  #残り計算

  erb :mypage
end

#Select Page
get '/select' do
  @friends_ids = []
  friendget(session['uid']).each do |id|
    @friends_ids << [id,userget(id)[4]]
  end
  erb :select
end

#IloveYou Page
get '/love' do
  target = userget(params['target'])
  @target_img = target[4]
  @target_name = target[1]
  @target_email = target[3]
  @my_id = session['uid']
  @target_id = params['target']
  erb :love
end

#Conversation Page
get '/conversation/:dir' do
  #告白してるとき
  if params[:dir] == 'to'
    @approach = gettarget(session['uid'])
  #告白されてるとき from
  else
    @approach = getlover(session['uid'])
  end
  @approach_id = @approach[0]
  @my_id = session['uid']
  @lover_id = @approach[1]
  @target_id = @approach[2]
  @lover_img = userget(@lover_id)[4]
  @target_img = userget(@target_id)[4]

  #追加質問リスト
  @questions = questiongetlist()

  #これまでのconversation
  @conversations = conversationget(@approach[0])
  erb :conversation
end

get '/question' do
  erb :question
end

#Regist
post '/useradd' do
  p params[:Name]
  p params[:Email]
  #session['uid'] = rand(4)
  redirect "/mypage"
end

#I love You
post '/iloveyou' do
  my_id = @params[:my_id]
  target_id = @params[:target_id]
  handle = @params[:handle]
  point = @params[:point]
  manifest = @params[:manifest]
  iloveyou(my_id, target_id, handle, point, manifest)
  redirect '/mypage'
end

#Question
post '/question' do
  conversationadd(@params[:approach_id], @params[:question_id])
  redirect '/conversation/to'
end

#Answer
post '/answer' do
  conversationup(@params[:conversation_id],@params[:answer])
  redirect '/conversation/to'
end

