module ApplicationHelper
  def user_image(user)
    return image_tag(user.image, alt: user.name) if user.image?
    if user.image.blank?
      img_url = 'NO_IMAGE.jpg'
    end
    image_tag(img_url, alt: user.name )
  end
  
  def restaurant_image(restaurant)
    return image_tag(restaurant.image, alt: restaurant.name) if restaurant.image?
    if restaurant.image.blank?
      img_url = 'NO_IMAGE.jpg'
    end
    image_tag(img_url, alt: restaurant.name )
  end
  
  def bath_image(bath)
    return image_tag(bath.image, alt: bath.name) if bath.image?
    if bath.image.blank?
      img_url = 'NO_IMAGE.jpg'
    end
    image_tag(img_url, alt: bath.name )
  end
  
  def comment_image(comment)
    return image_tag(comment.image, alt: comment.menu) if comment.image?
    if comment.image.blank?
      img_url = 'NO_IMAGE.jpg'
    end
    image_tag(img_url, alt: comment.menu )
  end
end
