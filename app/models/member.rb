class Member < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	has_many :posts
	has_many :favorites
	has_many :comments

  attachment :profile_image, destroy: false

  validates :name, presence: true
  validates :profile, presence: true, length: { minimum: 2 }

end
