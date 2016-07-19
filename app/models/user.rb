require File.join File.dirname(__FILE__), 'send_code'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 before_create :set_verified!

   has_one_time_password
  before_create :generate_authentication_token!

mount_base64_uploader :picture, PictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :stores
	has_many :bookings,dependent: :destroy
	has_many :stores, through: :bookings
	
	validates :email, presence: true

# code from previous work that works	
#def ensure_authentication_token
#	self.authentication_token = generate_authentication_token
#	self.save!
#	self.authentication_token
	
#end
def set_verified_true
	self.verified = true
	self.save
end


def generate_authentication_token!
		#loop do
		#token = Devise.friendly_token
		#break token unless User.where(authentication_token: token).first
		begin
      	self.authentication_token = Devise.friendly_token
    	end while self.class.exists?(authentication_token: authentication_token)	
	end

	private
	def set_verified!
		self.verified = false
		true
	end
end


