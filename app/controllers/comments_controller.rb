class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    
    @comment = @article.comments.create(comment_params.merge(commenter: current_user.email))
    
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    
    @comment = @article.comments.find(params[:id])
    
    @comment.destroy
    
    redirect_to article_path(@article), status: 303
  end

  private
  
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status, :user_id)
  end
end
