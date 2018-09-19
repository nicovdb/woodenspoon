class TeamusersController < ApplicationController
  def new
    @teamuser = Teamuser.new
  end

  def create
    Teamuser.create(teamuser_pseudo: teamuser_params[:teamuser_pseudo], team_id: teamuser_params[:team_id])
    redirect_to team_path(teamuser_params[:team_id])
  end

  def edit
    @team = Team.find(params[:id])
    @teamusers = @team.teamusers.map do |teamuser|
      teamuser.teamuser_pseudo if teamuser.user_id.nil?
    end
    @teamuser = Teamuser.new
  end

  def update
    @team = Team.find(teamuser_params[:team_id])
    @teamuser = Teamuser.find_by(teamuser_pseudo: teamuser_params[:teamuser_pseudo])
    @teamuser.update(user_id: current_user.id)
    redirect_to team_path(@team)
  end

  private

  def teamuser_params
    params.require(:teamuser).permit(:teamuser_pseudo, :team_id)
  end
end
