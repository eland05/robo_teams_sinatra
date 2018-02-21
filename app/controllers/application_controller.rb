class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "robo_secret"
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user # ?? nil ?? user instance
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  private

  def authenticate_user!
    if !logged_in?
      redirect '/login'
    end
  end
end
