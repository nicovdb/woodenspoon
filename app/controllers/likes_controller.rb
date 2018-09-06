class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @team = Team.find(like_params[:team])
    @like = Like.new(joke_id: like_params[:joke], user_id: current_user.id)
    if @like.save
      respond_to do |format|
        format.html {redirect_to team_path(@team)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render "teams/show"}
        format.js
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:joke, :team)
  end
end
