class SessionsController < ApplicationController
  before_action :check_session, except:[:index, :create, :login]

  def index
  end

  def register
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user[:id]
      redirect_to "/secrets"
    else
      flash[:errors] = ["you better check yo self before you wreck yo self"]
      redirect_to "/"
    end
  end

  def login

    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to "/secrets"
    else
      flash[:errors] = ["you better check yo self before you wreck yo self"]
      redirect_to "/"
    end

  end

  def logout
    session.delete(:user_id)
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
