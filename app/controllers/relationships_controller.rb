class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @user = User.find(params[:follow_id])
    @page_user = User.find(params[:page_user_id])
    current_user.follow(@user)
    #flash[:success] = 'ユーザをフォローしました。'
    #render partial: 'follow_button', locals: {:user => @user, :user_of_page => @page_user}
  end

  def destroy
    @user = User.find(params[:follow_id])
    @page_user = User.find(params[:page_user_id])
    current_user.unfollow(@user)
    #flash[:success] = 'ユーザのフォローを解除しました。'
    #render partial: 'follow_button', locals: {:user => @user, :user_of_page => @page_user}
  end
end
