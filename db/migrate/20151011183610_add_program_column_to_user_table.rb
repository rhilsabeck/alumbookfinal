#Ryan Hilsabeck migration to add program column that alumbook2 used
class AddProgramColumnToUserTable < ActiveRecord::Migration
  def up
    add_column :users, :program, :string
  end

  def down
  	remove_column :users, :program
  end
end
