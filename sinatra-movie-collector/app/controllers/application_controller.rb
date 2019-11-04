class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "authorization_movie_collector"
  end

  helpers do

    def logged_in?
      !!current_user
      # !!session[:email] # double negation to determine truthiness of object
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      # check if user with email exists
      #if so, set the session
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else   # otherwise, redirect
        redirect '/login'
      end
    end

    def logout
      session.clear
      puts "Logging Out..."
      redirect '/login'
    end

  end

  get '/' do
    redirect '/index'
  end

  get '/index' do
    @movies = Movie.all
    erb :index
  end

end
