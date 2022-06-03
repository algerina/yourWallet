require 'rails_helper'

RSpec.describe 'Category index page', type: :system do
  before do
    User.create(id: 6, name: 'name', email: 'name@name.com', password: 'password')
    Category.create(id: 1, author_id: 6, name: 'Books', icon: nil)
    Bill.create(name: "Poetry", amount: 3, author_id: 6)
  end

  describe 'Visiting the categories index page' do
    before :each do
      visit '/categories'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'should display user name' do
      expect(page).to have_text('name')
    end


    it 'should have an Add Category button' do
      expect(page).to have_text('Add New Category')
    end
  end
end