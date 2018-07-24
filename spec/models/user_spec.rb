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

    it "should have a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "should have a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "should have an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should have a unique email" do
      @user2 = User.create(
        first_name: 'Bob',
        last_name: 'Marley',
        email: 'test@test.com',
        password: '1234',
        password_confirmation:'1234'
      )
      expect(@user2).to_not be_valid
    end

    it "should have a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "should have a password with minimum of 4 chars" do
      @user.password = '123'
      expect(@user).to_not be_valid
    end

    it "should have a password_confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "password_confirmation should match password" do
      expect(@user.password_confirmation).to eql(@user.password)
    end

    describe ".authenticate_with_credentials" do
      pending #spaces in email and all caps
    end

end
