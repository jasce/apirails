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
show do |booking|
  attributes_table do
    row :date
    row :time
    row :store_category
    row "Attachments" do
      ul do
        i = 0
        booking.attachments.each do |attachment|
          li do
 #           link_to(image_tag(attachment.attachment_url, class: 'admin_attachment'), admin_attachment_path(attachment))
            i = i+1
            link_to " Attachment #{i}" ,"#{attachment.attachment_url}",target: "_blank"
            
          end
          i+1
        end
      end

    end
  
  end
end

end
