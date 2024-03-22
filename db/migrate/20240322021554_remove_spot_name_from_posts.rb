class RemoveSpotNameFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :spot_name, :string
  end
end
