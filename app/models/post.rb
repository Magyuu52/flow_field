class Post < ApplicationRecord
  has_one_attached :spot_image
  has_one_attached :flow_video

  def user
    return User.find_by(id: self.user_id)
  end
end
