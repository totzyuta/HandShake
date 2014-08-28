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
  @target_img = userget(session['uid'])[4]
  erb :select
end

#IloveYou Page
get '/love' do
  erb :love
end

#Conversation Page
get '/conversation' do
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
  p my_id = params[:my_id]
  p target_id = params[:target_id]
  p handle = params[:handle]
  p point = params[:point]
  p manifest = params[:manifest]
  iloveyou(my_id, target_id, handle, point, manifest)
  redirect '/mypage'
end

#Question
post '/question' do

end

#Answer
post '/answer' do

end

