class MypagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_user
  before_action ->{
    count(@user)
  }, except: :edit
  include UserActions
  
  def show
    @works = @user.works.order(created_at: :desc).page(params[:page])
  end

  def edit
  end

  def solved
    @works = @user.solved_works
  end

  def solve_later
    @works = @user.solve_later_works
  end
  
  private

  def set_user
    @user = current_user
  end
end
