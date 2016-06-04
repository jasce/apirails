class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :stores
	has_many :bookings,dependent: :destroy
	has_many :stores, through: :bookings
	has_and_belongs_to_many :business_companies
	has_and_belongs_to_many :business_individuals

	validates :email, presence: true
def ensure_authentication_token
	self.authentication_token = generate_authentication_token
	self.save!
	self.authentication_token
	
end
private

def generate_authentication_token
		loop do
		token = Devise.friendly_token
		break token unless User.where(authentication_token: token).first
			
		end
	end

end
