class AddUserNameToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_name, :string
  end
end
