class AddArchiveOnToGivingBacks < ActiveRecord::Migration
  def change
    add_column :giving_backs, :archive_on, :datetime
  end
end
