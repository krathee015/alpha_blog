class DislikesController < ApplicationController

    before_action :find_article
  def create
    if already_liked?
        flash[:alert] = "You can't dislike more than once"
      else
        @article.dislikes.create(user_id: current_user.id)
      end
    redirect_to article_path(@article)
  end
  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def already_liked?
    Dislike.where(user_id: current_user.id, article_id:
    params[:article_id]).exists?
  end

end
