class Project < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :name, presence: true, length: {maximum: 90, too_long: '90 chars is the maximum allowed'}
	validates :description, presence: true, length: {maximum: 200, too_long: '140 chars is the maximum allowed'}
	validates :location, presence: true, length: {maximum: 20, too_long: '20 chars is the max allowed'}

	validates :difficulty, presence: true
	validates :seeking, presence: true, length: {maximum: 144, too_long: '144 chars is the maximum allowed'}
	validates :stage, presence: true
	validates :project_email, presence: true, email_format: {
		message: 'doesnt look like an email address'
	}

	validates :start_time, presence: true
	validates :end_time, presence: true

	validate :valid_times



	mount_uploader :avatar, AvatarUploader

	scope :inactive, lambda { where('end_time < ?', DateTime.now )}

	scope :active, lambda { where('end_time >= ?', DateTime.now) }
  scope :featured, lambda { where('featured')}


	def valid_times
		if !end_time.nil? and !start_time.nil? then 
			if end_time < start_time
				errors.add(:end_time, 'cannot be before your start date' ) 
			end 

			if start_time < DateTime.now
				errors.add(:start_time, 'cannot be before now')
			end
			#TODO: at one point, only permit total lapse <= weekend
		end
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
