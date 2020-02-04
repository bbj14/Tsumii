class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def require_user_admin
    unless current_user.admin
      redirect_to root_url
    end
  end
  
  def count(user)
    @count_works = user.works.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likes = user.liked_works.count
    @count_solved = user.solved_works.count
    @count_solve_later = user.solve_later_works.count
  end
end
