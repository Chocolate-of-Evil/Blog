require 'rails_helper'

RSpec.describe "Create article" do
  let(:user) { create(:user) }
  context 'create article' do
    it "is valid" do

      sign_in user
      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content 'To your articles'
    end
    it "not valid" do

      sign_in user
      visit "/articles/new"
      fill_in 'Title', with: ''
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content "Title can't be blank"
    end
    it "not valid" do

      sign_in user
      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: ''
      click_button 'Create Article'
      expect(page).to have_content "Body can't be blank"
    end
    it "not valid" do

      sign_in user
      visit "/articles/new"
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'Yo'
      click_button 'Create Article'
      expect(page).to have_content 'Body is too short (minimum is 10 characters)'
    end
  end
end
