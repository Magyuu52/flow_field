class RemovePostIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :post_id, :integer
  end
end
