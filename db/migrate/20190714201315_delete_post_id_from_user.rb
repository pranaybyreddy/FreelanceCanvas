class DeletePostIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_id
  end
end
