class LikesController < ApplicationController
  def like
    Like.create(user_id:(params[:user_id]), secret_id:(params[:id]))
    # Like.find_by_user_id_and_secret_id(params[:user_id], params[:id])
    # Like.create(secret_params)
    redirect_to "/secrets"
  end

  def unlike
    # Like.destroy(user_id:(params[:user_id]), secret_id:(params[:id]))
    # try = Like.where(user_id:(params[:user_id]), secret_id:(params[:id]))
    @likes = Like.where("user_id = ? AND secret_id = ?", session[:user_id], params[:id])

    @likes.destroy_all
    redirect_to "/secrets"
  end

  def like_params
    params.require(:like).permit(:secret_id).merge(user: User.find(session[:user_id]) )
  end
end
