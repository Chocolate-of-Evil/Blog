require 'rails_helper'

RSpec.describe User do
  feature "log in process" do
    let(:user) { create(:user) }
    context 'with email and password' do
      it "is valid" do
        visit '/users/sign_in'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_content "Signed in successfully."
      end
    end
    context 'no email' do
      it "is not valid" do
        visit '/users/sign_in'
        fill_in 'Email', with: ""
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_content "Invalid Email or password."
      end
    end
    context 'no password' do
      it "is not valid" do
        visit '/users/sign_in'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: ""
        click_button 'Log in'
        expect(page).to have_content "Invalid Email or password."
      end
    end
  end
end
