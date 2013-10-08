class Project < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	# validates :avatar, presence: true

	mount_uploader :avatar, AvatarUploader

end
