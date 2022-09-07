require 'rails_helper'

RSpec.describe "Log in" do
  user = User.create(email: "2@mail.com", password: "222222")
  context 'no email' do
    it "not valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: ""
      fill_in 'Password', with: "222222"
      click_button 'Log in'
      expect(page).not_to have_content "Ваша почта:"
    end
  end
  context "no password" do
    it "not valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: "2@mail.com"
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).not_to have_content "Ваша почта:"
    end

  end
  context "with email and password" do
    it "is valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: "2@mail.com"
      fill_in 'Password', with: "222222"
      click_button 'Log in'
      expect(page).to have_content "Ваша почта:"
    end
  end

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
  end
end
