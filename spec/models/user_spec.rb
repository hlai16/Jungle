require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'Validations' do
  subject do
      User.new(
        name: "test user",
        email: "user@rspec.com",
        password: "password",
        password_confirmation: "password",
      )
  end
  
  it 'should be valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'should be invalid if name is blank' do 
    subject.name = nil 
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include "Name can't be blank"
  end
  it 'should be invalid if email is blank' do 
    subject.email = nil 
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include "Email can't be blank"
  end

  it 'should be invalid if password is blank' do 
    subject.password = nil 
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include "Password can't be blank"
  end
  it 'should be invalid if password confirmation is blank' do 
    subject.password_confirmation = nil 
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include "Password confirmation is too short (minimum is 8 characters)"
  end
  it 'should have password and password_confirmation matched' do
    subject.password = 'abcdefgh'
    subject.password_confirmation = 'abcdefgh'
    expect(subject).to be_valid
  end
  it 'is invalid with unmatching password and password_confirmation' do
    subject.password_confirmation = 'wwwwwwwwwwwwwwwwwwww'
    expect(subject).to_not be_valid
  end
  it 'is invalid when password is less than 8 characters' do
    subject.password = 'www'
    subject.password_confirmation = 'www'
    expect(subject).to_not be_valid
  end
 end
 describe '.authenticate_with_credentials' do
  it 'is invalid when email is already taken' do
    @user1 =
      User.new(
        name: "test user",
        email: "user@rspec.com",
        password: "password",
        password_confirmation: "password",
      )
    @user1.save

    new_user2 =
      User.new(
        name: "test user",
        email: "user@rspec.com",
        password: "password",
        password_confirmation: "password",
      )
    expect(new_user2).to_not be_valid
  end
 end
end
