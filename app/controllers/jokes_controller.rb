class JokesController < ApplicationController
  def new
    @joke = Joke.new
  end

  def create
    @team = Team.find(joke_params[:team].to_i)
    @user = User.find_by(pseudo: joke_params[:user_id])
    @joke = Joke.create(description: joke_params[:description], user_id: @user.id, team_id: @team.id)
    redirect_to team_path(@team)
  end

  private

  def joke_params
    params.require(:joke).permit(:description, :user_id, :team)
  end
end
