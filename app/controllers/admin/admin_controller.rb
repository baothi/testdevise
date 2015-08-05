class Admin::AdminController < ApplicationController
  authorize_resource :class => false
  layout "admin"
  # private
  #   def after_sign_in_path_for(resource)
  #     session[:admin_return_to].blank? ? admin_home_index_path : session[:admin_return_to]
  #   end

  #   def after_sign_out_path_for(resource_or_scope)
  #     new_admin_session_path
  #   end
end
