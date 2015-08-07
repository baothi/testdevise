class Admins::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end



  # def create
  #  @admin = Admins.new(admin_params)
  #  @admin.password = '1234abcd'
  #  @admin.password_confirmation = '1234abcd'
  #  if @admin.save
  #        @admin.update_attributes(:confirmation_token => nil,:confirmed_at => Time.now,:reset_password_token => (0...16).map{(65+rand(26)).chr}.join,:reset_password_sent_at => Time.now)
  #      AdminMailer.admin_link(@admin).deliver
  #      redirect_to admins_path
  #    else
  #   render :action => "new"
  #  end
  # end




  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
