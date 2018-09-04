class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  # def create
  #   @team = Team.find(user_params[:team].to_i)
  #   @user = User.find_or_create_by(pseudo: user_params[:pseudo])
  #   Teamuser.create(user_id: @user.id, team_id: @team.id)
  #   redirect_to team_path(@team)
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:pseudo, :team, :photo)
  # end
end
