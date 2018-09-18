class TeamusersController < ApplicationController
  def new
    @teamuser = Teamuser.new
  end

  def create
    Teamuser.create(teamuser_pseudo: teamuser_params[:teamuser_pseudo], team_id: teamuser_params[:team_id])
    redirect_to team_path(teamuser_params[:team_id])
  end

  # def update
  #   @team = Team.find_by(code: teamuser_params[:team_id].strip)
  #   Teamuser.create(user_id: current_user.id, team_id: @team.id)
  #   redirect_to team_path(@team)
  # end

  private

  def teamuser_params
    params.require(:teamuser).permit(:teamuser_pseudo, :team_id)
  end
end
