require 'twilio-ruby'

class SendCode

   def initialize
     account_sid = 'AC8954fce3a0f5363ca2602507c53d0408'
     auth_token = '99d6deaeef8637a5fc2925aca216c732'
          @client = Twilio::REST::Client.new account_sid, auth_token
     @t_phone = '+1 315-883-2807'
   end 

   def send_sms(options = {})
     @client.account.sms.messages.create(options.merge!({:from => @t_phone}))

   end

end