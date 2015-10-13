#Ryan Hilsabeck removing birday month, year and day columns used by alumbook1
class FixBirthdayFields < ActiveRecord::Migration
  def up
    remove_column :users, :birth_month
    remove_column :users, :birth_day
    remove_column :users, :birth_year
  end

  def down
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :birth_year, :integer
  end
 
end
