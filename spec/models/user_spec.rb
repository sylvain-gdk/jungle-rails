require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  before :each do
    @user = User.create(
      first_name: 'Bob',
      last_name: 'Marley',
      email: 'test@test.com',
      password: '1234',
      password_confirmation:'1234'
    )
  end

  it "should have a password with minimum of 4 chars" do
    @user.valid?
    expect(@user).to be_valid
  end

  it "password_confirmation should match password" do
    expect(@user.password_confirmation).to eql(@user.password)
  end

  # describe ".authenticate_with_credentials" do
  #   pending expect(@user.authenticate_with_credentials(@user)).to be_true
  # end

  # expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")

end
