class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    array = Recruiter.pluck(:company_name)
    array.pop
     resource.company_id = 1
    puts resource.company_id
    if array.include?(resource.company_name)
      recruiter_path(resource) 
    else
      new_company_path
    end
  end
end