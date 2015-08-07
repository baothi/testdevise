class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  after_create :notify_email_admin_signup

  private
    def notify_email_admin_signup
      AdminMailer.admin_mailer(self).deliver_later	
    end
end
