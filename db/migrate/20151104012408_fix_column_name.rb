class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :giving_backs, :completed, :contacted
  end
end
