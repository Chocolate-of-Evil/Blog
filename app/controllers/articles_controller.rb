class ArticlesController < ApplicationController

  before_action :authenticate_user!
  def index
    @articles = Article.where(status: :public).order(:created_at).page(params[:page]).per(5)
  end
    def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def all
    @articles = Article.where(status: :public).order(:created_at).page(params[:page]).per(5)
  end
  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id)
    end
end
