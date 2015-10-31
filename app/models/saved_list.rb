#Created by Victor
class SavedList < ActiveRecord::Base
  belongs_to :login
  has_many :saved_list_users, :dependent => :destroy
  has_many :users, through: :saved_list_users
end
