class MembersController < ApplicationController
  get '/members' do
    if logged_in?
      @teams = current_user.teams
      erb :'/members/members'
    else
      redirect to '/'
    end
  end

  get '/members/:id/edit' do
    @member = Member.find(params[:id])
    erb :'/members/edit'
  end

  patch '/members/:id' do
    @member = Member.find(params[:id])
    if current_user.team_ids.include?(@member.team_id)
      @member.update(params[:member])
      flash[:update] = "Your team member was updated."
    end
    redirect to '/members'
  end
end
