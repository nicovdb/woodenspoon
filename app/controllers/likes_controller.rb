class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @team = Team.find(like_params[:team])
    @like = Like.create(joke_id: like_params[:joke], user_id: current_user.id)
    redirect_to team_path(@team)
  end

  private

  def like_params
    params.require(:like).permit(:joke, :team)
  end
end
