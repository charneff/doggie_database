class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "puppykisses"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Owner.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      owner = Owner.find_by(:email => email)
      if owner && owner.authenticate(password)
        session[:email] = owner.email
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

  end

end
