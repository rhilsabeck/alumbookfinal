# Created by Victor, edited by Maxwell Barvian
class UndergraduateDegree < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :degree
  belongs_to :college

  accepts_nested_attributes_for :degree
  accepts_nested_attributes_for :college
end
