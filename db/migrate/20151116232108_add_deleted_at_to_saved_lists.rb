class AddDeletedAtToSavedLists < ActiveRecord::Migration
  def change
    add_column :saved_lists, :deleted_at, :datetime
    add_index :saved_lists, :deleted_at, where: "deleted_at IS NULL"
  end
end
