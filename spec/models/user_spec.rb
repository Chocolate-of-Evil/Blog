require 'rails_helper'

describe User, type: :model do
subject(:model) { described_class.new(user_params) }

  context 'with valid atributes' do
    let(:user_params) { { email: "test@mail.ru", password: "123456"} }
    it 'is valid' do
      expect(model).to be_valid
    end
  end

  context 'without email' do
    let(:user_params) { { email: "", password: "123456"} }
    it 'is not valid' do
      expect(model).not_to be_valid
    end
  end

  context 'without password' do
    let(:user_params) { { email: "test@mail.ru", password: ""} }
    it 'is not valid' do
      expect(model).not_to be_valid
    end
  end
end
