class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :stores
	has_many :bookings,dependent: :destroy
	has_many :stores, through: :bookings
	has_and_belongs_to_many :business_companies
	has_and_belongs_to_many :business_individuals

	validates :email, presence: true

# code from previous work that works	
#def ensure_authentication_token
#	self.authentication_token = generate_authentication_token
#	self.save!
#	self.authentication_token
	
#end


def generate_authentication_token!
		#loop do
		#token = Devise.friendly_token
		#break token unless User.where(authentication_token: token).first
		begin
      	self.authentication_token = Devise.friendly_token
    	end while self.class.exists?(authentication_token: authentication_token)	
	end
end


