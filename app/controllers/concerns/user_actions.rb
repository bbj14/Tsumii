module UserActions
  def followings
    @followings = @user.followings.order(created_at: :desc).page(params[:page])
  end
  
  def followers
    @followers = @user.followers.order(created_at: :desc).page(params[:page])
  end
  
  def likes
    @likes = @user.liked_works.order(created_at: :desc).page(params[:page])
  end
  
  private
  
  def set_user
    raise NotImplementedError
  end
end