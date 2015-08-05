class Admins::SessionsController < Devise::SessionsController
  layout "admin"
  protected
    def after_sign_in_path_for(resource)
      session[:admin_return_to].blank? ? admin_root_path : session[:admin_return_to]
    end

    def after_sign_out_path_for(resource_or_scope)
      new_admin_session_path
    end
end
