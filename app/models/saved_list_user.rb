#Created by Victor
class SavedListUser < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :saved_list
end
