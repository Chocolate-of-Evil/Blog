class HomeController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def about_me
  end

  def contact_me
  end
end
