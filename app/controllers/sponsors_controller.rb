class SponsorController < ApplicationController
  get '/sponsors' do
    if logged_in?
      erb :'/sponsors/sponsors'
    else
      redirect to '/'
    end
  end

  post  '/sponsors' do
    Sponsor.create(params[:sponsor])
    flash[:added] = "You added a new sponsor."
    redirect to '/sponsors'
  end

  get '/sponsor/new' do
    if logged_in?
      erb :'/sponsors/new'
    else
      redirect to '/'
    end
  end

  get '/sponsors/:id/edit' do
    @sponsor = Sponsor.find(params[:id])
    erb :'/sponsors/edit'
  end

  patch '/sponsors/:id' do
    @sponsor = Sponsor.find(params[:id])
    @sponsor.update(params[:sponsor])
    flash[:update] = "Your sponsor name was updated."
    redirect to '/sponsors'
  end

end
