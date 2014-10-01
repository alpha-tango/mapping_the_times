require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'json'
require 'dotenv'
require 'csv'

Dotenv.load



get '/' do

  erb :index
end
