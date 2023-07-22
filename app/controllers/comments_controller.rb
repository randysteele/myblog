class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update]

    def new 
        if params[:article_id] && @article = Article.find_by_id(params[:article_id])
          @comment = @article.comments.build
        else
          @comment = Comment.new
        end
      end

    # def create
    #     @comment = @article.comments.create(params[:comment].permit(:name, :comment, :article_id, :user_id))
    #     redirect_to article_path(@article)    
    # end

    def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_to article_comments_path
      else
        render :new
      end
    end

    def index
      if params[:article_id] && @article = Article.find_by_id(params[:article_id])
        @comments = @article.comments
      else
        @comments = Comment.all
        end
      end
    
  
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    def comment_params
      params.require(:comment).permit(:name, :comment, :article_id, :user_id)
    end

    def set_comment
      @comment = Comment.find_by(id: params[:id])
     end
end
