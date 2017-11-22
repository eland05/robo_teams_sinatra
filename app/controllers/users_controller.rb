class UsersController < ApplicationController

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    redirect to '/teams'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    redirect to '/teams'
  end
end
