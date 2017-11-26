class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/teams"
    else
      flash[:error] = "Your username or password was incorrect."
      redirect to '/'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect to '/teams'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "Please be sure to complete both the username and password."
      redirect to '/signup'

    elsif User.find_by(username: params[:username])
      flash[:error] = "That username is already taken, please try a different one."
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/teams'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:logged_out] = "You have been logged out."
      redirect to '/'
    else
      redirect to '/'
    end
  end

end
