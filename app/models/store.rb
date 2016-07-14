class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   mount_base64_uploader :picture, StorePictureUploader

    before_create :generate_authentication_token!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#has_and_belongs_to_many :users
	has_many :bookings,dependent: :destroy
	has_many :users,through: :bookings
	validates :email, presence: true
	has_many :respond_bookings
	belongs_to :store_category

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?


def store_category_attributes=(attributes)
	self.store_category = StoreCategory.find_or_create_by(category: attributes[:category])
end


def generate_authentication_token!
		#loop do
		#token = Devise.friendly_token
		#break token unless User.where(authentication_token: token).first
		begin
      	self.authentication_token = Devise.friendly_token
    	end while self.class.exists?(authentication_token: authentication_token)	
	end
end
