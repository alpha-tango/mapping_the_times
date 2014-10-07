require 'sinatra'

get '/' do
  send_file 'tests/basic.html'
end
