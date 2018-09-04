class JokesController < ApplicationController
  def new
    @joke = Joke.new
    @team = Team.find(params[:team_id])
    @users = @team.teamusers.map do |teamuser|
      User.find(teamuser.user_id).pseudo
    end
  end

  def create
    @team = Team.find(joke_params[:team_id].to_i)
    @user = User.find_by(pseudo: joke_params[:user_id])
    @joke = Joke.create(description: joke_params[:description].capitalize, user_id: @user.id, team_id: @team.id)
    redirect_to team_path(@team)
  end

  private

  def joke_params
    params.require(:joke).permit(:description, :user_id, :team_id)
  end
end
