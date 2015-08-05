class Admins::RegistrationsController < Devise::RegistrationsController
    # disable default no_authentication action
  # skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  # now we need admin to register new admin
  # prepend_before_action :authenticate_scope!, only: [:new, :create, :cancel]
   layout "admin"
   protected
    def after_sign_up_path_for(resource)
      signed_in_root_path(resource)
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
end