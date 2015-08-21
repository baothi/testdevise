class Admin::SessionsController < ApplicationController
  layout 'admin'
  def new
  end

  def create
    admin_admin = Admin::Admin.find_by(email: params[:session][:email].downcase)
    if admin_admin && admin_admin.authenticate(params[:session][:password])
    #   if user.activated?
        log_in admin_admin
        params[:session][:remember_me] == '1' ? remember(admin_admin) : forget(admin_admin)
        redirect_back_or admin_admin
    #   else
    #     message  = "Account not activated. "
    #     message += "Check your email for the activation link."
    #     flash[:warning] = message
    #     redirect_to root_url
    #   end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

   def destroy
     log_out if logged_in?
    redirect_to admin_admins_path
  end
end
