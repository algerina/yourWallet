require 'rails_helper'

RSpec.describe 'Sign up page', type: :feature do
  before :each do
    @user1 = User.new(name: 'test', email: 'test@gmail.com', password: '123456',
                      password_confirmation: '123456')
    visit new_user_registration_path
  end

  it 'should see the input fields in registration page' do
    expect(page).to have_field 'Full Name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Password confirmation'
  end

  it 'should be able to sign up successfully and go to categories page' do
    fill_in 'Full Name', with: 'test'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: @user1.password_confirmation
    click_button 'Sign up'
    expect(page).to have_content('CATEGORIES')
  end

  it "should throw an error  if the password don't match" do
    fill_in 'Full Name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  it 'should throw an error  if the email is already taken' do
    @user1.save
    fill_in 'Full Name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: @user1.password_confirmation
    click_button 'Sign up'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Email has already been taken')
  end
end
