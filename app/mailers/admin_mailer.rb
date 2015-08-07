class AdminMailer < ApplicationMailer
  # layout 'admins/mailer/admin_mailer'
  def welcome_email(admin)
    @admin = admin
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end
end
