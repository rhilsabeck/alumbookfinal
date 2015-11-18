# Created by Victor, edited by Maxwell Barvian
class UserPhone < ActiveRecord::Base
  acts_as_paranoid
  self.inheritance_column = nil # Allows the type column to be used without interfering with Rails' conventions

  belongs_to :user

  enum type: [ :home, :work, :mobile ]
end
