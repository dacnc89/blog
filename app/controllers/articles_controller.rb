class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner, only: [:edit, :destroy]

  def index
    @articles = Article.search(params[:search])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
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
    @article.user_id = current_user.id
    if @article.update(article_params)

      flash[:success] = "Edit successful"
      redirect_to article_path
    else
      flash[:warning] = "Some error when updating article #{@article.errors.full_messages}"
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
    params.require(:article).permit(:title, :text, :user_id)
  end

  def check_owner
    
    if current_user.id != @article.user_id 
      flash[:warning] = "Sorry, only owner can do this thing!"
      redirect_to articles_path
    end
  end



end
