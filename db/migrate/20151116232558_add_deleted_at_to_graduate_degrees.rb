class AddDeletedAtToGraduateDegrees < ActiveRecord::Migration
  def change
    add_column :graduate_degrees, :deleted_at, :datetime
    add_index :graduate_degrees, :deleted_at, where: "deleted_at IS NULL"
  end
end
