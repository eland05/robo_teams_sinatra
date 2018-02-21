class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      @teams = current_user.teams
      erb :'teams/teams'
    else
      flash[:error] = "Please log in or sign up."
      redirect to '/'
    end
  end

  get '/teams/new' do
    if logged_in?
      erb :'/teams/new'
    else
      redirect to '/'
    end
  end

  post '/teams/new' do
    @team = current_user.teams.create(params[:team])

    params[:new_members].each do |m|
      if m["name"] != ""
        @team.members.create(m)
      end
    end

    if params[:new_sponsor][:name] != ""
      @team.sponsors << Sponsor.create(params[:new_sponsor])
    end
    flash[:success] = "You have created your new team."
    redirect to :"/teams/#{@team.id}"
  end

  get '/teams/:id' do
    if logged_in? && @team = current_user.teams.find_by_id(params[:id])
        erb :'teams/show'
    else
      redirect to '/'
    end
  end

  get '/teams/:id/edit' do
    authenticate_user!
    if @team = current_user.teams.find_by_id(params[:id])
      erb :'teams/edit'
    else
      redirect to '/teams'
    end
  end

  patch '/teams/:id' do
    authenticate_user!
    if @team = current_user.teams.find_by_id(params[:id])
      @team.update(params[:team])
      flash[:update] = "Your team has been updated."
      redirect to "/teams/#{@team.id}"
    else
      redirect '/teams'
    end
  end

  get '/teams/:id/delete' do
    if logged_in? && @team = current_user.teams.find_by_id(params[:id])
        erb :'teams/delete'
    else
      redirect to '/'
    end
  end

  delete '/teams/:id/delete' do
    @team = current_user.teams.find_by_id(params[:id])
    @team.destroy
    flash[:deleted] = "Your team was deleted."
    redirect to '/teams'
  end
end
