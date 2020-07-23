class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in!"
      redirect_to root_path
    else
      flash[:notice] = "Invalid name entered!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out!"
    redirect_to root_path
  end
end
