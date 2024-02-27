class Post < ApplicationRecord
  has_one_attached :spot_image
  has_one_attached :flow_video

  def user
    return Post.find_by(id: self.id)
  end
end
