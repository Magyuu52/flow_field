class ChangeUserNameToPosts < ActiveRecord::Migration[7.0]
  def down
    change_column :posts, :user_name, :string
  end
end
