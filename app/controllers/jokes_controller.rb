class JokesController < ApplicationController
  def new
    @joke = Joke.new
    @team = Team.find(params[:team_id])
    @teamusers = @team.teamusers.map do |teamuser|
      teamuser.teamuser_pseudo
    end
  end

  def create
    @team = Team.find(joke_params[:team_id].to_i)
    @teamuser = Teamuser.find_by(teamuser_pseudo: joke_params[:teamuser_id])
    @joke = Joke.create(description: joke_params[:description].capitalize, teamuser_id: @teamuser.id, team_id: @team.id)
    redirect_to team_path(@team)
  end

  private

  def joke_params
    params.require(:joke).permit(:description, :teamuser_id, :team_id)
  end
end
