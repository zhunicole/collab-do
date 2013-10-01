class User < ActiveRecord::Base

	validates :email, uniqueness: true
	validates :password, length: { minimum: 6 }

end
