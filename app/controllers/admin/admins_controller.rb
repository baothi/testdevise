class Admin::AdminsController < ApplicationController
  layout 'admin'
  def index
    @admin_admins = Admin::Admin.all
  end
   
  def show
    @admin_admin = Admin::Admin.find(params[:id])
  end

  def new
    @admin_admin = Admin::Admin.new
  end

  def create
    debugger
    @admin_admin = Admin::Admin.new(admin_admin_params)
    if @admin_admin.save
      # @admin_admins.activated = true
      # @admin_admins.create_reset_digest
      # @admin_admins.send_password_reset_email
      # @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to admin_admins_path

    else
      render 'new'
    end
  end
  
  private

    def admin_admin_params
      params.require(:admin_admin).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
