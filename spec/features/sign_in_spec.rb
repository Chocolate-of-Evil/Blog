# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '#user' do
  feature '.log_in_process' do
    let(:user) { create(:user) }

    context 'with email and password' do
      before do
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'is valid' do
        expect(page).to have_content 'Signed in successfully.'
      end
    end

    context 'without email' do
      before do
        visit new_user_session_path
        fill_in 'Email', with: nil
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'is not valid' do
        expect(page).to have_content 'Invalid Email or password.'
      end
    end

    context 'without password' do
      before do
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: nil
        click_button 'Log in'
      end

      scenario 'is not valid' do
        expect(page).to have_content 'Invalid Email or password.'
      end
    end
  end
end
