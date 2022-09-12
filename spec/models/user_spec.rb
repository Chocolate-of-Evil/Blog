require 'rails_helper'

describe User, type: :model do
  let(:user) { build(:user) }
  it 'is valid with valid atributes' do
    expect(user).to be_valid
  end

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
