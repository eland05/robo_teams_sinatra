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
      redirect to '/signup'
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
      redirect to '/'
    else
      redirect to '/'
    end
  end

end
