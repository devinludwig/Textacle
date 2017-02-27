require 'rails_helper'


describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '11111111', :from => '9718035899')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
