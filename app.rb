require 'sinatra'

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  session[:authenticated] = true
  redirect '/'
end

post '/logout' do
  session[:authenticated] = false
  redirect '/'
end

get '/auth_token' do
  session[:authenticated] ? MAGIC_WORD : 'FAIL'
end

