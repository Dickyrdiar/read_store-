require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "nakdeknaknan427@gmail.com", password: "kolateral") }

  before { subject.save }

  it "email should be present" do
    subject.email = nil 
    expect(subject).to_not be_valid 
  end 
end
