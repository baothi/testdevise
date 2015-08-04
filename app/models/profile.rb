class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin
  has_many :locations
  mount_uploader :avatar, AvatarUploader
  accepts_nested_attributes_for :locations
  # attr_accessible :location_attributes
   def to_s
    address
  end
end
