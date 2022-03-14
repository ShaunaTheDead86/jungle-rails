require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate an email address' do
      @user = User.new(:email => 'shaunathedead86@gmail.com')

      expect(@user).to have_attributes(:email => 'shaunathedead86@gmail.com')
    end

    it 'should validate emails with spaces before or after' do
      @user = User.new(:email => '  shaunathedead86@gmail.com  ')
      @user[:email].strip!

      expect(@user).to have_attributes(:email => 'shaunathedead86@gmail.com')
    end

    it 'should validate a password' do
      @user = User.new(:password => 'password')

      expect(@user).to have_attributes(:password => 'password')
    end

    it 'should not validate when email and password don\'t match' do
      @user = User.new(:email => 'shaunathedead86@gmail.com', :password => 'password')

      expect(@user).to_not have_attributes(:email => nil, :password => nil)
    end

    
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
