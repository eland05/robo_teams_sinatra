class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      @teams = current_user.teams
      erb :'teams/teams'
    else
      redirect to '/login'
    end
  end

  get '/teams/new' do
    if logged_in?
      erb :'/teams/new'
    else
      redirect to '/login'
    end
  end

  post '/teams/new' do
    binding.pry
    @team = current_user.teams.create(params[:team_info])
    params[:team][:members].each do |m|
      if m["name"] != ""
        @team.members.create(m)
      end
    end
    erb :'/teams/show'
  end
end
