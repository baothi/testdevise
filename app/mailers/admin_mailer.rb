class AdminMailer < ApplicationMailer
  before_filter :set_host_from_request, only: [:create]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.account_activation.subject
  #
  def account_activation(admin_admin)
    @admin_admin = admin_admin
    mail to: admin_admin.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(admin_admin)
    @admin_admin = admin_admin
    mail to: admin_admin.email, subject: "Password reset"
  end

  private
    def set_host_from_request
      ActionMailer::Base.default_url_options = { host: request.host_with_port }
    end

end
