# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def about_me; end
end
