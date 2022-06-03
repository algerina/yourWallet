require 'rails_helper'

RSpec.describe 'Bill index page', type: :system do
  before do
    user1 = User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
    user1.save
    category1 = user1.categories.new(name: 'category1', icon: nil, id:1)
    category1.save
    Bill1 = category1.bills.new(name: 'bill1', amount: 30, author_id:1)

  end

  describe 'Visiting the bills index page' do
    before :each do
      visit '/categories/1/bills'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'category1'
      # click_link 'New Transaction'
    end

    it 'should display the transactions List' do
      expect(page).to have_text('TRANSACTIONS')
    end

    it 'should display the transaction name' do
      expect(page).to have_text('bill1')
    end


    it 'should have an Add transaction button' do
      expect(page).to have_text('New Transaction')
    end
  end
end