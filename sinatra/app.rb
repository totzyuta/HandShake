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

  erb :mypage
end

#Select Page
get '/select' do
  @friends_ids = []
  p session['uid']
  friendget(session['uid']).each do |id|
    @friends_ids << [id,userget(id)[4]]
  end
  erb :select
end

#IloveYou Page
get '/love' do
  @target_img = userget(params['target'])[4]
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
  p @questions = questiongetlist()

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
  session['uid'] = rand(4)
  redirect "/mypage"
end

#I love You
post '/iloveyou' do
  p my_id = @params[:my_id]
  p target_id = @params[:target_id]
  p handle = @params[:handle]
  p point = @params[:point]
  p manifest = @params[:manifest]
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

