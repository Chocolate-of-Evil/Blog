# frozen_string_literal: true

class DraftsController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.all.order(created_at: :desc)
  end
end
