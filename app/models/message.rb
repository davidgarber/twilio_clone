class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC72ac747d55727988c118c902fd1f6b12/Messages.json',
      :user => 'AC72ac747d55727988c118c902fd1f6b12',
      :password => '45efa013b05c6bad9931abc50477f26b',
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
      ).execute
  end
end
