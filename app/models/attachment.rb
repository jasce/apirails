class Attachment < ActiveRecord::Base
  belongs_to :booking
  mount_base64_uploader :attachment, BookingListUploader
end
