ActiveAdmin.register Booking do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :confirmed, :status
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do
	column :user
	column :store
	column :store_category
	column :status
	column :date
	column :time
	column :address
	column :discount
	column :confirmed

	 column "Attachments" do |booking|
    booking.attachments.map(&:attachment).join("<br />").html_safe
  end
end

end
