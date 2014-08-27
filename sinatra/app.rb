# encoding: utf-8
require 'sinatra'
require 'slim'
require 'mysql'
# require 'omniauth'
# require 'omniauth-twitter'
require 'cgi'
require 'digest/md5'
# load 'database.rb'

#set :port, 80

#Top Page
get '/' do
    "Hello World!"
end

#Sign up Page
get '/regist' do

end

#My Page
get '/mypage' do

end

#IloveYou Page
get 'love' do

end

#Conversation Page
get 'conversation' do

end

#Regist
post '/useradd' do

end

#Question
post '/question' do

end

#Answer
post '/answer' do

end
