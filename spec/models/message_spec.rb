require 'rails_helper'

describe Message do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '+13106517687')
    message.save.should be_false
  end
end
