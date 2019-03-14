class ArticlesController < ApplicationController
  before_action :fetch_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(set_params)
    if @article.save
      flash[:notice] = "Successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(set_params)
      flash[:notice] = "Successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to articles_path
  end

  private

  def set_params
    params.require(:article).permit(:title, :description)
  end

  def fetch_article
    @article = Article.find(params[:id])
  end
end