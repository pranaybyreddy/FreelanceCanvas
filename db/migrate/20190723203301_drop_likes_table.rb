class DropLikesTable < ActiveRecord::Migration[5.2]
  def change
    def up
      drop_table :likes
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
