class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    recruiter_path(current_recruiter)
  end 
end
