class AddContactedByToGivingBack < ActiveRecord::Migration
  def change
  	add_column :giving_backs, :contacted_by, :integer
  end
end
