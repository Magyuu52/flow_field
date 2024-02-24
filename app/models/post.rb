class Post < ApplicationRecord
  has_one_attached :spot_image
  has_one_attached :flow_video
end
