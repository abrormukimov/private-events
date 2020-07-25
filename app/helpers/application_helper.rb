module ApplicationHelper

  def check_signup
    if logged_in?
      link_to "Create Event", new_event_path, class: "btn btn-outline-success btn-center" 
    else
      link_to 'Sign Up', signup_path, class: "btn btn-outline-success btn-center"
    end
  end

  def check_signin
    if logged_in?
      link_to "Log Out", logout_path, method: :delete, class: "btn btn-outline-success"
    else
      link_to "Log In", login_path, class: "btn btn-outline-success"
    end
  end

  def show_profile
    if logged_in?
      link_to "#{current_user.name}", user_path(current_user), class: "btn btn-outline-success"
    end
  end

  def list_of_attendees
    if @attendees.empty?
      puts "No attendees yet!"
    else
      @attendees.pluck(:name).join(", ")
    end
  end
  
end
