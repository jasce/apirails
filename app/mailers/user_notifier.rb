class UserNotifier < ApplicationMailer
	def respond_mail(user , booking , store = nil)
		@user = user
		@booking = booking
		@store = store
		mail(to: @user.email, subject: 'Response On your Booking')
	end
end
