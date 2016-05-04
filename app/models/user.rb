class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :stores
	has_many :bookings
	has_many :stores, through: :bookings
	has_and_belongs_to_many :business_companies
	has_and_belongs_to_many :business_individuals

	validates :email, presence: true


end
