class SessionsController < ApplicationController

  get '/' do
    erb :"sessions/welcome"
  end

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/dogs'
  end

  get '/logout' do
    logout!
    redirect '/'
  end

  post'/logout' do
    logout!
    redirect '/'
  end 

end
