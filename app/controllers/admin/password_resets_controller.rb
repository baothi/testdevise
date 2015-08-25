class Admin::PasswordResetsController < ApplicationController
  layout 'admin'
  before_action :get_admin,   only: [:edit, :update]
  before_action :valid_admin, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    @admin_admin = Admin::Admin.find_by(email: params[:password_reset][:email].downcase)
    if @admin_admin
      @admin_admin.create_reset_digest
      @admin_admin.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to admin_root_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
  
  def update
    byebug
    if params[:admin_admin][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    elsif @admin_admin.update_attributes(admin_admin_params)
      log_in @admin_admin
      flash[:success] = "Password has been reset."
      redirect_to @admin_admin
    else
      render 'edit'
    end
  end

  private
    
    def admin_admin_params
      params.require(:admin_admin).permit(:password,:password_confirmation)
    end

    def get_admin
      @admin_admin = Admin::Admin.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_admin
      unless (@admin_admin && @admin_admin.activated? &&
              @admin_admin.authenticated?(:reset, params[:id]))
        redirect_to admin_admin
      end
    end
    
    def check_expiration
      if @admin_admin.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_admin_password_reset_path
      end
    end

end
