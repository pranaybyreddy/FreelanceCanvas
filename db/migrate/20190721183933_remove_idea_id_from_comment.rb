class RemoveIdeaIdFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :idea_id, :integer
  end
end
