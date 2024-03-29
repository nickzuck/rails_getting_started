class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.delete
      redirect_to article_path(@article)
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
