class SessionsController < ApplicationController

  get '/' do
    redirect '/login'
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
    redirect '/dogs'
  end

end
