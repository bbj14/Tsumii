class WorkStatusesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.create_status(@work, @status)
    flash[:success] = "作品を#{@status}に追加しました"
    redirect_back(fallback_location: root_url)
  end
  
  def update
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.change_status(@work, @status)
    flash[:success] = "作品を#{@status}に変更しました"
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.delete_status(@work)
    flash[:success] = "作品を#{@status}から削除しました"
    redirect_back(fallback_location: root_url)
  end
end
