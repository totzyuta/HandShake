# encoding: utf-8
require 'sinatra'
require 'mysql'
# require 'omniauth'
# require 'omniauth-twitter'
require 'cgi'
require 'digest/md5'
# load 'db.rb'

set :port, 80

#Top Page
get '/' do
  erb :index
end

#Sign up Page
get '/regist' do
  erb :regist
end

#My Page
get '/mypage' do
  erb :mypage
end

#Select Page
get '/select' do
  erb :select
end

#IloveYou Page
get '/love' do
  erb :love
end

#Conversation Page
get '/conversation' do
  erb :convasation
end

get '/question' do
  erb :question
end

#Regist
post '/useradd' do

end

#I love You
post '/iloveyou' do

end

#Question
post '/question' do

end

#Answer
post '/answer' do

end

