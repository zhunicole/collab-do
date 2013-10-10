class Project < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :name, presence: true
	validates :description, presence: true
	validates :location, presence: true

	validates :start_time, presence: true
	validates :end_time, presence: true

	validate :valid_times

	mount_uploader :avatar, AvatarUploader


	scope :inactive, lambda { where('end_time < ?', DateTime.now )}

	scope :active, lambda { where('end_time >= ?', DateTime.now) }


	def valid_times
		if end_time < start_time
			errors.add(:end_time, 'cannot be before your start date' ) 
		end 

		if start_time < DateTime.now
			errors.add(:start_time, 'cannot be before now')
		end
		#TODO: at one point, only permit total lapse <= weekend
	end


	def creator
		User.find(creator_id)
	end

	def active?
		Project.active.each do |p|
			if p == self then return true end
		end
		false
	end

end
