module UsersHelper
  def user_fit_image(user)
    image_tag (user.image&.url || "default_icon1"), class: "image-fit"
  end
  
  def user_image(user, size, id = nil)
    image_tag (user.image&.url || "default_icon1"), class: "image-fit", size: "#{size}x#{size}", id: id
  end
end
