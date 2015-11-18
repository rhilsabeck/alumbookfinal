class AddDeletedAtToUserSurveys < ActiveRecord::Migration
  def change
    add_column :user_surveys, :deleted_at, :datetime
    add_index :user_surveys, :deleted_at, where: "deleted_at IS NULL"
  end
end
