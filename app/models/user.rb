class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_and_belongs_to_many :projects
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :location, presence: true, on: :update


  def name
    if first_name and last_name then
    	first_name + ' ' + last_name
    else 
      'User Name'
    end
  end

end

