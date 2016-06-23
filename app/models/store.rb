class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :users
	has_many :bookings,dependent: :destroy
	has_many :users,through: :bookings
	validates :email, presence: true

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
