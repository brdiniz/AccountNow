# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def current_session
    session[:id]
  end
  
  def current_user
    session[:current_user]
  end
  
  private
  def maintain_session_and_user
    @session = Session.find_by_id(current_session)
    redirect_to(new_session_path) unless @session
  end
end
