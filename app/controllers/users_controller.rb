class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at desc')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You have successfully signed up!'
      redirect_to user_path(@user)
    else
      render :new
    end
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
end
