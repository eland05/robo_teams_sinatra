class TeamsController < ApplicationController

  get '/teams' do
    erb :'/teams/teams'
  end
end