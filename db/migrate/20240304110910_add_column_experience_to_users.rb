class AddColumnExperienceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :experience, :string
  end
end
