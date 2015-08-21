class Admin::AdminsController < ApplicationController
  layout 'admin'
  before_action :logged_in_admin, only: [:index, :edit, :update]
  before_action :correct_admin,   only: [:edit, :update]
  def index
    @admin_admins = Admin::Admin.all
  end
   
  def show
    @admin_admin = Admin::Admin.find(params[:id])
  end
  
  def edit
    @admin_admin = Admin::Admin.find(params[:id])
  end

  def new
    @admin_admin = Admin::Admin.new
  end

  def create
    # debugger
    @admin_admin = Admin::Admin.new(admin_admin_params)
    if @admin_admin.save
      # @admin_admins.activated = true
      # @admin_admins.create_reset_digest
      # @admin_admins.send_password_reset_email
      # @user.send_activation_email
      log_in @admin_admin
      flash[:info] = "Please check your email to activate your account."
      redirect_to admin_admins_path

    else
      render 'new'
    end
  end
  
  def update
    @admin_admin = Admin::Admin.find(params[:id])
    if @admin_admin.update_attributes(admin_admin_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @admin_admin
    else
      render 'edit'
    end
  end


  def destroy
   Admin::Admin.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_admins_url
  end

  private

    def admin_admin_params
      params.require(:admin_admin).permit(:name, :email, :password,
                                   :password_confirmation)
    end

   # Confirms a logged-in user.
    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to admin_login_path
      end
    end

    # Confirms the correct user.
    def correct_admin
      @admin_admin = Admin::Admin.find(params[:id])
      redirect_to(admin_admins_path) unless current_user?(@admin_admin)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(admin_admins_path) unless current_user.admin?
    end

end
