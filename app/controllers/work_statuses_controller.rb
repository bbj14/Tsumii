class WorkStatusesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.create_status(@work, @status)
    
    flash[:success] = "作品を#{status_to_text(@status)}に追加しました"
    redirect_back(fallback_location: root_url)
  end
  
  def update
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.change_status(@work, @status)
    
    flash[:success] = "作品を#{status_to_text(@status)}に変更しました"
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @work = Work.find(params[:work_id])
    @status = params[:status]
    current_user.delete_status(@work)
    
    flash[:success] = "作品を#{status_to_text(@status)}から削除しました"
    redirect_back(fallback_location: root_url)
  end
  
  private
  
  def status_to_text(status)
    if status == "solved"
      "解答済"
    elsif status == "solve_later"
      "あとで解く"
    end
  end
end
