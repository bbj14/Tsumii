module UserActions
  
  def likes
    @likes = @user.liked_works.order(created_at: :desc).page(params[:page])
  end
  
  private
  
  def set_user
    raise NotImplementedError
  end
end