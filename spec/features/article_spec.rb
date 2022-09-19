require 'rails_helper'

RSpec.describe ".create_article" do
  let(:user) { create(:user) }
  context 'create article with filled in fields' do
    let(:article) { build(:article, user: user) }
    it "is valid" do
      expect(article).to be_valid
    end
  end
  context 'create article without a title' do
    let(:article) { build(:article, title: '', user: user) }
    it "is not valid" do
      expect(article).not_to be_valid
    end
  end
  context 'create article without a body' do
    let(:article) { build(:article, body: '', user: user) }
    it "is not valid" do
      expect(article).not_to be_valid
    end
  end
  context 'create article with short body' do
    let(:article) { build(:article, body: 'Yo', user: user) }
    it "is not valid" do
      expect(article).not_to be_valid
    end
  end
end
