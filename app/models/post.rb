class Post < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 30}}
  validates :content, {presence: true, length: {maximum: 500}}
  validates :address, presence: true
  has_one_attached :spot_image
  has_one_attached :flow_video
  validates :spot_image, blob: { content_type: :image }
  validates :flow_video, blob: { content_type: :video }
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  has_many :likes, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    if search != ""
      Post.where(['title LIKE(?) OR spot_name LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end
end
