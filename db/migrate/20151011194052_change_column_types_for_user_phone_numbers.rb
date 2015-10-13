#Ryan Hilsabeck changing user phones column types to match alumbook2
class ChangeColumnTypesForUserPhoneNumbers < ActiveRecord::Migration
  def change
  	change_column :user_phones, :country_code, :string
  	change_column :user_phones, :area_code, :string
  	change_column :user_phones, :prefix, :string
  	change_column :user_phones, :suffix, :string
  	change_column :user_phones, :extension, :string
  end
end
