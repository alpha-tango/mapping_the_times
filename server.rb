require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'json'
require 'dotenv'

Dotenv.load



get '/' do
  jfun = File.read('countrydata.json')
  @data = JSON.parse(jfun)
  send_file File.join('public' 'index.html')
end

set :public_folder, settings.root + '/tests'
