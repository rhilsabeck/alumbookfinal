class AddDeletedAtToGivingBacks < ActiveRecord::Migration
  def change
    add_column :giving_backs, :deleted_at, :datetime
    add_index :giving_backs, :deleted_at, where: "deleted_at IS NULL"
  end
end
