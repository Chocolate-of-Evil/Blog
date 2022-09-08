require 'rails_helper'

RSpec.describe "Log in" do
  let(:user) { create :user, email: "2@mail.com", password: "222222" }
  context 'create article' do
    it "is valid" do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: '2@mail.com'
      fill_in 'Password', with: '222222'
      click_button 'Log in'

      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content 'To your articles'
    end
    it "not valid" do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: '2@mail.com'
      fill_in 'Password', with: '222222'
      click_button 'Log in'

      visit "/articles/new"
      fill_in 'Title', with: ''
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content "Title can't be blank"
    end
    it "not valid" do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: '2@mail.com'
      fill_in 'Password', with: '222222'
      click_button 'Log in'

      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: ''
      click_button 'Create Article'
      expect(page).to have_content "Body can't be blank"
    end
    it "not valid" do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: '2@mail.com'
      fill_in 'Password', with: '222222'
      click_button 'Log in'

      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'Yo'
      click_button 'Create Article'
      expect(page).to have_content 'Body is too short (minimum is 10 characters)'
    end
  end
end
