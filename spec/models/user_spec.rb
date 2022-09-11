require 'rails_helper'

RSpec.describe User, type: :model do
  it "user is valid" do
    user = User.new( name: "User", email: "user@user.com", password: "123456")

    expect(user).to be_valid
    expect(user.email).to eql "user@user.com"
    expect(user.name).to eql "User"
  end

  it "user is not valid" do
    user = User.new( name: "", email: "", password: "123456")

    expect(user).to_not be_valid
  end
end
