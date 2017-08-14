class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Created article #{@article.title}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:success] = "Edit successful"
      redirect_to article_path
    else
    render 'edit'
    end
  end

  def destroy
    if
      @article.destroy
      redirect_to root_path
      flash[:success] = "Deleted this article"
    else
      flash.now[:warm] = "You have to login as admin"
    end
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
