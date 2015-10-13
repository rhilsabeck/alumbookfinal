#Ryan Hilsabeck adding new birthday column to use what alumbook2 was using
class AddBirthDayColumn < ActiveRecord::Migration
  def up
    add_column :users, :birth_day, :date
  end

  def down
  	remove_column :users, :birth_day
  end
end
