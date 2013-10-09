class Project < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :name, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	mount_uploader :avatar, AvatarUploader



	def creator
		
		User.find(creator_id)
	end

end
