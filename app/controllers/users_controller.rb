class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all.order("created_at desc")
  end

  def new
    @user = User.new
  end

  def create
    @user = current_user.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
    else
      render :new
    end

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @attended_events = current_user.attended_events
    @past_events = current_user.past_events
    @upcoming_events = current_user.upcoming_events
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def require_login
    return true if session[:user_id]

    redirect_to new_session_path
    false
  end

end
