class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner, only: [:edit, :destroy]
  def show
    # @comment = Comment.find(params[:id])
    
  end

  def new
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.new
  end

  def create
    @user = current_user
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
#    @comment.save!
    @comments = @article.comments

    respond_to do |format|
      if @comment.save
        format.html {redirect_to @article}
        format.js
      else
        flash[:warning] = "You have to login to post your comment"
      end 
    end

  end
    
  
  def edit
    respond_to do |format|
      format.html  
      format.js  
    end
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html do  
          flash[:success] = "Edited !"
          redirect_to article_path(@article)
        end
        format.js   
      end
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.find(params[:id])
    if @comment.destroy
      @comments=@article.comments
      respond_to do |format|
        format.html do
          flash[:warning] = "Deleted! this comment"
          redirect_to article_path(@article)
        end
        format.js  
      end
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
