class SecretsController < ApplicationController
  before_action :check_sessions, except:[:index, :create, :login]

  def index

    @secrets = Secret.all

    @like = Like.all
  end

  def create
     secret = Secret.new(secret_params)

     if secret.save
       redirect_to "/users/#{:user_id}"
    else
      flash[:errors] = secret.errors.full_messages
      redirect_to '/secrets'
    end
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy




    redirect_to "/users/#{:user_id}"

  end

  private


  def check_sessions
        if !session[:user_id]
            redirect_to '/'
        end
    end

  def secret_params
    params.require(:secret).permit(:content).merge(user: User.find(session[:user_id]))
  end
end
