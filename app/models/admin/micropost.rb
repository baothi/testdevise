class Admin::Micropost < ActiveRecord::Base
  belongs_to :admin
  validates :content, length: { maximum: 140 },presence: true

end
