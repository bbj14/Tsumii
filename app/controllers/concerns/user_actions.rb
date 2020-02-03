module UserActions
  def followings
    set_user
    @followings = @user.followings.page(params[:page])
    count(@user)
  end
  
  def followers
    set_user
    @followers = @user.followers.page(params[:page])
    count(@user)
  end
  
  def likes
    set_user
    count(@user)
  end
end