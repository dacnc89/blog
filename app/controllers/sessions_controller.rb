class SessionsController < ApplicationController
  def new
   redirect_to article_path if user_signed_in?
  end

  def create
    if params[:email].present? && params[:password].present?
      user = User.find_by(email: params[:email])
      if user
        user_authorize = user.authenticate(params[:password])
      end
    end
    if user_authorize 
      flash[:success] = "Hey, true email and password"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:warning] = "Please enter truthly email and password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You logged out!"
    redirect_to articles_path 
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
