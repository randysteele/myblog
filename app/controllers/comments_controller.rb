class CommentsController < ApplicationController

    def new 
        if params[:article_id] && @article = Article.find_by_id(params[:article_id])
          @comment = @article.comments.build
        else
          @comment = Comment.new
        end
      end

    def create
        @article = Article.find(params[:article_id])
          @comment = @article.comments.create(params[:comment].permit(:name, :comment))
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

    def comment_params
      params.require(:comment).permit(:name, :comment, :article_id)
    end
end
