class OwnersController < ApplicationController

  get '/signup' do
    erb :"owners/new"
  end

  get '/owners' do
    @owners = Owner.all
    erb :"owners/index"
  end

  get '/owners/:id' do
    @owner = Owner.find_by_id(params[:id])
    if @owner
      erb :"owners/show"
    else
      redirect "/owners"
    end
  end

  post '/owners/all' do
    redirect "/owners"
  end


  post '/owners' do
    @owner = Owner.new
    @owner.owner_name = params[:owner_name]
    @owner.email = params[:email]
    @owner.password = params[:password]
    if @owner.save
      redirect '/login'
    else
      erb :"owners/new"
    end
  end
end
