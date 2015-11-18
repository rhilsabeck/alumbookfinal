# Created by Victor, edited by Maxwell Barvian
class GraduateDegree < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :degree
  belongs_to :college

  enum status: [ :completed, :in_progress ]

  accepts_nested_attributes_for :degree
  accepts_nested_attributes_for :college
end
