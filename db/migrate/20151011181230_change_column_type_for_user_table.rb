#Ryan Hilsabeck changing column types for user table to match alumbook2
class ChangeColumnTypeForUserTable < ActiveRecord::Migration
  def change
  	change_column :users, :general_opt_in, :integer
  	change_column :users, :email_opt_in, :integer
  	change_column :users, :phone_opt_in, :integer
  	change_column :users, :badges_opt_in, :integer
  	change_column :users, :zip, :string
  end
end
