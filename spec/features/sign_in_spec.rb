require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  feature "log in process" do
    scenario "is valid with email and password" do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content "Signed in successfully."
    end
    it "not valid no email" do
      visit '/users/sign_in'
      fill_in 'Email', with: ""
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content "Invalid Email or password."
    end
    it "not valid no password" do
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_content "Invalid Email or password."
    end
  end
end
