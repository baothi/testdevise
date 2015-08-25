class Admin::AccountActivationsController < ApplicationController
  layout 'admin'
  def edit
    admin_admin = Admin::Admin.find_by(email: params[:email])
    if admin_admin && !admin_admin.activated? && admin_admin.authenticated?(:activation, params[:id])
      admin_admin.activate
      log_in admin_admin
      flash[:success] = "Account activated!"
      redirect_to admin_admin
    else
      flash[:danger] = "Invalid activation link"
      redirect_to admin_admin
    end
  end
end
