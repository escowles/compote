require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create! email: user_email, password: "xxxxxxxx" }
  let(:user_email) { "test@example.org" }

  it "has an email" do
    expect(user.email).to eq(user_email)
  end 
end
