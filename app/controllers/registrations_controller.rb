class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
  # params.delete("email")
  # params.delete("username")
  if params[:password].blank?
    params.delete(:current_password)
    params.delete(:password)
    params.delete(:password_confirmation)
    resource.update_without_password(params)
  else
    resource.update_with_password(params)
  end
end

    def after_update_path_for(resource)
      user_path(resource)
    end

end
