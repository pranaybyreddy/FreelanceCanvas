class AddUserToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :user_name, :string
  end
end
