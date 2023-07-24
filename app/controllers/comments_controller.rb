class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def new 
    @article = Article.fine(params[:article_id])
    @comment = @article.comments.new(parent_id: params[:parent_id])

  end

  def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.new(comment_params)
      redirect_to article_path(@article)    
  end

  def index
      @comments = Comment.all
    end
  

  def destroy
      @post = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment, :article_id, :parent_id, :user_id)
  end
end