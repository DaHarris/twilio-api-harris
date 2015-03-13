class SendSms

  require 'rubygems'
  require 'twilio-ruby'



  def initialize
    @classmates = [["Caleb Atwood", "18025226128"], ["Daniel Harris", "19702107931"], ["Danielle Mullane", "13038199094"],
            ["Finnegan Hewitt", "12072724863"], ["Ty Hyten", "16189104999"]]
    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message(whatever)
    message = @client.account.messages.create(:body => whatever,
        :to => "+19702107931",     # Replace with your phone number
        :from => "+19706446267")   # Replace with your Twilio number
  end

  def send_to(number, whatever)
    message = @client.account.messages.create(:body => whatever,
        :to => number.to_s,     # Replace with your phone number
        :from => "+19706446267")   # Replace with your Twilio number
  end


  def send_to_classmates(whatever)
    @classmates.each do |classmate|
      message = @client.account.messages.create(:body => whatever,
          :to => "classmate[1]",     # Replace with your phone number
          :from => "+19706446267")   # Replace with your Twilio number
    end
  end
end
