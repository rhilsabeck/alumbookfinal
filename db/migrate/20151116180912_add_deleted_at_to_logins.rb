class AddDeletedAtToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :deleted_at, :datetime
    add_index :logins, :deleted_at, where: "deleted_at IS NULL"
  end
end
