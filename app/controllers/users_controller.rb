class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "created user."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user] = "Updated user"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(param[:id])
    if @user.destroy
      flash[:success] = "Deleted user #{@user.name}"
      redirect_to root_path
    else
      flash[:succes] = "Can not delete user, you dont have supper user permission"
    end
  end 

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end

end
