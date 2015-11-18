class AddDeletedAtToUndergraduateDegrees < ActiveRecord::Migration
  def change
    add_column :undergraduate_degrees, :deleted_at, :datetime
    add_index :undergraduate_degrees, :deleted_at, where: "deleted_at IS NULL"
  end
end
