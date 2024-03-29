# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @articles = Article.where(status: :public).order(created_at: :desc).page(params[:page]).per(5)
  end

  def about_me; end
end
