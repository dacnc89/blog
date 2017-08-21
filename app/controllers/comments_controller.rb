class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner, only: [:edit, :destroy]
  def show
    # @comment = Comment.find(params[:id])
    
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    if user_signed_in?
      @user = current_user
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      @comment.commenter = current_user.name
      @comment.user_id = current_user.id
      if @comment.save
        flash[:success] = "created comment"
        redirect_to article_path(@article)
      else
        flash[:warning] = "Can not create comment"
        redirect_to  article_path(@article)

      end
    else
      flash[:info] = "Please login to comment for this article"
      redirect_to login_path
    end
  end
  
  def edit
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Edited !"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:warning] = "Deleted! this comment"
      redirect_to article_path(@article)
    else
      flash[:info] = "Cant delete without login"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id, :user_id)
  end

  def set_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def check_owner
    if current_user.id != @comment.user_id 
      flash[:warning] = "Sorry, only owner can do this thing!"
      redirect_to articles_path
    end
  end
end
