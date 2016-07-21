class StoreNotifier < ApplicationMailer
	
	def self.send_multiple(user , booking ,stores)
		@stores = stores
		@stores.each do |store| 
			new_lead_mail(user,booking,store).deliver
		end
	end
	def hired_mail(user , booking , store)
		@user = user
		@booking = booking
		@store = store
		mail(to: @store.email, subject: 'Congratulations ! You have been hired ')		
	end

	def new_lead_mail(user , booking , store)
		@user = user
		@booking = booking
		@store = store
		mail(to: @store.email, subject: 'You have a new lead near your location !')		
	end

end
