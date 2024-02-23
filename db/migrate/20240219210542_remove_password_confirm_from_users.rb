class RemovePasswordConfirmFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_confirm, :string
  end
end
