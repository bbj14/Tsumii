class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @work = Work.find(params[:work_id])
    current_user.like(@work)
    #flash[:success] = '作品をお気に入りに追加しました'
    render partial: 'like_button', locals: {:work => @work}
  end
  
  def destroy
    @work = Work.find(params[:work_id])
    current_user.unlike(@work)
    #flash[:success] = '作品をお気に入りから削除しました'
    render partial: 'like_button', locals: {:work => @work}
  end
end
