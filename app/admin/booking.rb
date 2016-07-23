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

	column :id do |booking|
		link_to booking.id , [:admin,booking]
	end
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
        actions
  end

  show do
  		row "Images" do
   ul do
    booking.attachments.each do |img|
      li do 
        image_tag(img.attachment.url)
      end
    end
   end
end
  end
 
end

