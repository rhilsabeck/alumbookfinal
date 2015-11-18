class AddDeletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at, where: "deleted_at IS NULL"
  end
end
