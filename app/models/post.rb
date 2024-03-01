class Post < ApplicationRecord
  has_one_attached :spot_image
  has_one_attached :flow_video
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end
end
