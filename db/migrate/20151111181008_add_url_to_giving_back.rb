class AddUrlToGivingBack < ActiveRecord::Migration
  def change
    add_column :giving_backs, :url, :string
  end
end
