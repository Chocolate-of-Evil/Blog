require 'rails_helper'

describe Article do

  it "title and body can't be empty" do
    article = Article.new
    article.title = ""
    article.validate
    expect(article.errors[:title]).not_to include ("can't be empty")
  end
end
