# frozen_string_literal: true

require 'rails_helper'

describe '#user', type: :model do
  context 'without email' do
    let(:user) { build(:user, email: nil) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end

  context 'without password' do
    let(:user) { build(:user, password: nil) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end
end
