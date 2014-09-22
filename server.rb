require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'json'
require 'dotenv'
require 'csv'

Dotenv.load



get '/' do
  url = "http://api.nytimes.com/svc/semantic/v2/geocodes/query.json?&api-key=#{ENV['SECRET_KEY']}"
  binding.pry
  result = RestClient::Request.execute(method: :get, url: url)
  hash = JSON.parse(result)
  @result = hash

  erb :index
end
