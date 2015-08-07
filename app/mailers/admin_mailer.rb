class AdminMailer < ApplicationMailer
  # layout 'admins/mailer/admin_mailer'
  def admin_mailer(admin)
    @admin = admin
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end
end
