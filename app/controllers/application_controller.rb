class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def self.setting_session_userid_to_test(userid)
    @userid = userid
  end

  def self.session_user_id_to_test
    @userid
  end
end
