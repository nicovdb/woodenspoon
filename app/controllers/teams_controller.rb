class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    redirect_to team_path(@team)
  end

  def show
    @team = Team.find(params[:id])

    @users = @team.teamusers.map do |teamuser|
      User.find(teamuser.user_id)
    end

    @jokes = Joke.where(team_id: @team.id).order(created_at: :desc)

    @user = User.new
    @joke = Joke.new
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

end
