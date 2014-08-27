# encoding: utf-8
require 'sinatra'
require 'slim'
require 'mysql'
# require 'omniauth'
# require 'omniauth-twitter'
require 'cgi'
require 'digest/md5'
# load 'database.rb'

get '/' do
    "Hello World!"
end

