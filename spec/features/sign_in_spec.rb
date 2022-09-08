require 'rails_helper'

RSpec.describe "Log in" do
  let(:user) { create :user, email: "2@mail.com", password: "222222" }

  context 'no email' do
    it "not valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: ""
      fill_in 'Password', with: "222222"
      click_button 'Log in'
      expect(page).to have_content "Invalid Email or password."
    end
  end
  context "no password" do
    it "not valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: "2@mail.com"
      fill_in 'Password', with: ""
      click_button 'Log in'
      expect(page).to have_content "Invalid Email or password."
    end

  end
  context "with email and password" do
    it "is valid" do
      visit '/users/sign_in'
      fill_in 'Email', with: "2@mail.com"
      fill_in 'Password', with: "222222"
      click_button 'Log in'
      expect(page).to have_content "Ваша почта: 2@mail.com"
    end
  end
end
