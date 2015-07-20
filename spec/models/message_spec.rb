require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '3106517687')
    message.save.should be false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '3106517687' )
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 11111 is not a valid phone number."]
  end
end
