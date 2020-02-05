class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @comment = current_user.comments.build(coment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = 'コメントの投稿に失敗しました。'
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy!
      flash[:success] = "コメントを削除しました"
      redirect_back(fallback_location: root_url)
    end
  end
  
  private
  
  def coment_params
    params.require(:comment).permit(:work_id, :comment)
  end
end
