module ApplicationHelper
  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium),
      id: 'image-preview',
      class: 'img-responsive img-circle profile-image'
      if user.avatar.exists?
        image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
      end
  end

  def profile_thumb_select(user)
    return image_tag user.avatar.url(:thumb),
      id: 'image-preview',
      class: 'img-responsive img-circle profile-image'
      if user.avatar.exists?
        image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
      end
  end
end
