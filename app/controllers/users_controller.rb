class UsersController < ApplicationController

  def index
    @users = User.all.order("created_at desc")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
    else
      render :new
    end

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
