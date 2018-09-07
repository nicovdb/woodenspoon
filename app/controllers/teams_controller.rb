require 'securerandom'

class TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @code = SecureRandom.urlsafe_base64(5)
    @team = Team.create(name: team_params[:name].capitalize, description: team_params[:description].capitalize, code: @code)
    Teamuser.create(user_id: current_user.id, team_id: @team.id)
    redirect_to team_path(@team)
  end

  def show
    @team = Team.find(params[:id])
    @users = @team.users
    @jokes = @team.jokes.reverse
    @like = Like.new
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

end
