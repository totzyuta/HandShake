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
  #redirect '/mypage' if session['uid'] != nil
  erb :index
end

#デモ用
get '/u/:name' do
  session[:uid] = userlogin(params[:name])[0]
  redirect '/mypage'
end

#デバッグ用 session 付ける
get '/session/:uid' do
  if params[:uid] == 'rm'
    session[:uid] = nil
    redirect '/'
  end

  session[:uid] = params[:uid]
  redirect '/mypage'
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
  tmpl = 'style="border: dashed 1px #fff; background-color: #ec902e;"'
  begin
    #告白してる
    @target = userget(target[2])
    @target_name = @target[1]
    @target_img = @target[4]
    #進捗計算
    conversations = conversationget(target[0])
    i = 0;
    conversations.each do |conv|
      i = i + 15;
      i = i + 15 if conv[4] != nil
    end

    #最終告白が終わっているか
    i = i + 5 if target[7] == 2.to_s
    i = i + 10 if target[7] == 3.to_s

    #円を破線にする
    @target_circle1 = i >= 15 ? "" : tmpl
    @target_circle2 = i >= 30 ? "" : tmpl
    @target_circle3 = i >= 45 ? "" : tmpl
    @target_circle4 = i >= 60 ? "" : tmpl
    @target_circle5 = i >= 75 ? "" : tmpl
    @target_circle6 = i >= 90 ? "" : tmpl
    @target_circle7 = i >= 95 ? "" : tmpl
    @target_circle8 = i >= 100 ? "" : tmpl

    @target_progress = i.to_s + '%'
  rescue
    #告白してない
    @target_img = ""

    #円を破線にする
    @target_circle1 = tmpl
    @target_circle2 = tmpl
    @target_circle3 = tmpl
    @target_circle4 = tmpl
    @target_circle5 = tmpl
    @target_circle6 = tmpl
    @target_circle7 = tmpl
    @target_circle8 = tmpl
  end

  #告白されている方
  lover = getlover(user[0])
  tmpl = 'style="border: dashed 1px #ec902e; background-color: #fff;"'
  begin
    #告白されてる
    @lover = userget(lover[1])
    @lover_name =@lover[1]
    @lover_img = @lover[4]
    #進捗計算
    conversations = conversationget(lover[0])
    i = 0;
    conversations.each do |conv|
      i = i + 15;
      i = i + 15 if conv[4] != nil
    end

    #最終告白が終わっているか
    i = i + 5 if lover[7] == 2.to_s
    i = i + 10 if lover[7] == 3.to_s

    #円を破線にする
    @lover_circle1 = i >= 15 ? "" : tmpl
    @lover_circle2 = i >= 30 ? "" : tmpl
    @lover_circle3 = i >= 45 ? "" : tmpl
    @lover_circle4 = i >= 60 ? "" : tmpl
    @lover_circle5 = i >= 75 ? "" : tmpl
    @lover_circle6 = i >= 90 ? "" : tmpl
    @lover_circle7 = i >= 95 ? "" : tmpl
    @lover_circle8 = i >= 100 ? "" : tmpl

    @lover_circle_rate = i
    @lover_progress = i.to_s + '%'
  rescue
    #告白されてない
    @lover_img = ""

    #円を破線にする
    @lover_circle1 = tmpl
    @lover_circle2 = tmpl
    @lover_circle3 = tmpl
    @lover_circle4 = tmpl
    @lover_circle5 = tmpl
    @lover_circle6 = tmpl
    @lover_circle7 = tmpl
    @lover_circle8 = tmpl
  end

  #残り計算

  erb :mypage
end

#Select Page
get '/select' do
  @friends_ids = []
  friendget(session['uid']).each do |id|
    @friends_ids << [id,userget(id)[4], userget(id)[1]]
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

# 結果発表
get '/result' do
  my_id = session[:uid]
  @user = userget(my_id)
  approach = gettarget(my_id)
  target = userget(approach[2])

  @target_img = target[4]
  @target_name = target[1]
  @target_email = target[3]
  @my_id = session['uid']
  @target_id = params['target']

  erb :result
end

#Conversation Page
get '/conversation/:dir' do
  if params[:dir] == 'to'
    #告白してるとき
    @approach = gettarget(session['uid'])
  elsif params[:dir] == 'from'
    #告白されてるとき from
    @approach = getlover(session['uid'])
  else
    #デバッグ用id直打ち
    @approach = getlover(params[:dir])
  end
  @approach_id = @approach[0]
  @my_id = session['uid']
  @lover_id = @approach[1]
  @target_id = @approach[2]
  lover = userget(@lover_id)
  target = userget(@target_id)
  @lover_img = lover[4]
  @target_img = target[4]
  @target_name = target[1]

  #追加質問リスト
  @questions = questiongetlist()

  #これまでのconversation
  @conversations = conversationget(@approach[0])

  if params[:dir] == 'to'
    erb :conversation_to
  elsif params[:dir] == 'from'
    @lover_img = '/images/unknown.png'
    erb :conversation_from
  else
  end
end

#恋愛度MAX，最後の告白
get '/lovemax' do
  my_id = session[:uid]
  @user = userget(my_id)
  approach = gettarget(my_id)
  @target = userget(approach[2])
  @target_name = @target[1]
  @target_img = @target[4]
  @user_name = @user[1]
  @user_img =@user[4]
  @approach_id = approach[0]

  erb :lovemax
end

#告白の返事
get '/return' do
  my_id = session[:uid]
  @user = userget(my_id)
  approach = getlover(my_id)
  @lover = userget(approach[1])
  @lover_name = @lover[1]
  @lover_img = @lover[4]
  @user_name = @user[1]
  @user_img =@user[4]
  @approach_id = approach[0]
  @approach_main = approach[8]

  erb :return
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

#I love You Final
post '/iloveyoufinal' do
  approach_id = @params[:approach_id]
  main = @params[:main]
  iloveyoufinal(approach_id, main)
  redirect '/mypage'
end

#I love You Result
post '/iloveyouresult' do
  approach_id = @params[:approach_id]
  response = @params[:response]
  result = (("受ける" == @params[:judge]) ? true : false)
  loveisok(approach_id, response, result)
  redirect '/mypage'
end

#Question
post '/question' do
  conversationadd(@params[:approach_id], @params[:question_id])
  redirect '/mypage'
end

#Answer
post '/answer' do
  conversationup(@params[:conversation_id],@params[:answer])
  redirect '/mypage'
end

