class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @team = Team.find(like_params[:team])
    @joke = Joke.find(like_params[:joke])
    @like = Like.new(joke_id: like_params[:joke], user_id: current_user.id)

    if @like.save
      @likes_count = @like.joke.likes.count
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
