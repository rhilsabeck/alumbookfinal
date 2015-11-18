class AddDeletedAtToUserPhones < ActiveRecord::Migration
  def change
    add_column :user_phones, :deleted_at, :datetime
    add_index :user_phones, :deleted_at, where: "deleted_at IS NULL"
  end
end
