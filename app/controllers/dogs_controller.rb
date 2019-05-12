class DogsController < ApplicationController

  get '/dogs' do
    @dogs = Dog.all
    erb :'dogs/index'
  end

  get '/dogs/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"dogs/new"
    end
  end

  get '/dogs/:id' do
    @dog = Dog.find_by_id(params[:id])

    if @dog
      erb :"dogs/show"
    else
      redirect "/dogs"
    end
  end


  get '/dogs/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      @dog = Dog.find_by_id(params[:id])
      erb :"/dogs/edit"
    end
  end

  post '/dogs/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      @dog = Dog.find_by_id(params[:id])
      redirect "/dogs/#{@dog.id}/edit"
    end

  end


  post '/dogs' do
    dog = Dog.new(name: params["name"],
      breed: params["breed"],
      age: params["age"],
      fixed: params["fixed"],
      owner: current_user)

    if dog.save
      redirect "/dogs/#{dog.id}"
    else
      redirect "dogs/new"
    end
  end

  patch '/dogs/:id' do
      @dog = Dog.find_by_id(params["id"])

      if @dog.update(name: params["name"], breed: params["breed"], age: params["age"], fixed: params["fixed"])
          redirect "/dogs/#{@dog.id}"
      else
          erb :"/dogs/edit"
      end
  end

  delete "/dogs/:id" do
       @dog = Dog.find_by_id(params["id"])

       if @dog.destroy
           redirect "/dogs"
       else
           redirect "/dogs/#{@dog.id}"
       end
   end
end