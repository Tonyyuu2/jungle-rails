require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new
  end


  describe 'Validations' do

    it 'must check if password and password confirmation match' do
      newUser = User.new(first_name: 'John', last_name: 'Doe', email: 'John@example.com', password: 'password', password_confirmation: 'notPassword')
      newUser.valid?
      expect(newUser.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

    it 'must check if password field is not empty' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'John@example.com', password: nil, password_confirmation: 'notPassword')

      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password is too short (minimum is 3 characters)")
    end

    it 'will if email already exists reagrdless of case_sensitive' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'John@example.com', password: 'notPassword', password_confirmation: 'notPassword')
      user.save
      user2 = User.new(first_name: 'John', last_name: 'Doe', email: 'JOHN@EXAMPLE.COM', password: 'notPassword', password_confirmation: 'notPassword')
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not let user register if first_name is empty' do
      user = User.new(first_name: nil, last_name: 'Doe', email: 'John@example.com', password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'should not let user register if last_name is empty' do
      user = User.new(first_name: 'John', last_name: nil, email: 'John@example.com', password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not let user register if password length is less than 3' do
      user = User.new(first_name:'John', last_name: 'Doe', email: 'John@example.com', password: 'pa', password_confirmation: 'pa')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  describe '.authenticate_with_credentials' do

    it 'should not authenticate when email is blank' do
      @user = User.authenticate_with_credentials(' ', '1111')
      expect(@user).to eq(nil)
    end
    
    it 'should not authenticate when password is blank' do
      @user = User.authenticate_with_credentials('John@example.com', nil)
      expect(@user).to eq(nil)
    end

    it 'should return the user with valid login details' do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'tylerBjorn@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      validUser = User.authenticate_with_credentials("tylerBjorn@gmail.com", "password")
      expect(validUser.first_name).to eq('John')
    end
#come back to this 
  end
  end
end
