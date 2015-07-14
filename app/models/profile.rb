class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  mount_uploader :avatar, AvatarUploader
  accepts_nested_attributes_for :location
  # attr_accessible :location_attributes
end
