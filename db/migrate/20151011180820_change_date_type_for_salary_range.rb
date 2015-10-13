#Ryan Hilsabeck changing column type for salary range to match alumbook2
class ChangeDateTypeForSalaryRange < ActiveRecord::Migration
  def change
  		change_column :users, :salary_range, :integer
  end
end
