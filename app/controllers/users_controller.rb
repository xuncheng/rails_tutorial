class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by_slug(params[:id])
  end

  def edit
    @user = User.find_by_slug(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:remember_token] = @user.remember_token
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find_by_slug(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile update successed."
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
