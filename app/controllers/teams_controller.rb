require 'securerandom'

class TeamsController < ApplicationController
  def index
    @teams = current_user.teamusers.map do |teamuser|
      Team.find(teamuser.team_id)
    end
  end

  def new
    @team = Team.new
  end

  def create
    @code = SecureRandom.urlsafe_base64(5)
    @team = Team.create(name: team_params[:name], description: team_params[:description], code: @code)
    Teamuser.create(user_id: current_user.id, team_id: @team.id)
    redirect_to team_path(@team)
  end

  def show
    @team = Team.find(params[:id])

    @users = @team.teamusers.map do |teamuser|
      User.find(teamuser.user_id)
    end

    @jokes = Joke.where(team_id: @team.id).order(created_at: :desc)

    @like = Like.new
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

end
