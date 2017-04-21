class UsersController < ApplicationController
  before_action :check_session
  # this above statement checks for session before it does any action.
  def show
    @user = User.find(session[:user_id])
    @like = Like.all


    @secrets = Secret.all

    @like = Like.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :secret_id, :like_id)
  end


end
