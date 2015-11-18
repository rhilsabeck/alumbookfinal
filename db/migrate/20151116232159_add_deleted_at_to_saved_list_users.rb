class AddDeletedAtToSavedListUsers < ActiveRecord::Migration
  def change
    add_column :saved_list_users, :deleted_at, :datetime
    add_index :saved_list_users, :deleted_at, where: "deleted_at IS NULL"
  end
end
