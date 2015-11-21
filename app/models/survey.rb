#Created by Tessa, Modified by Victor, Ryan Hilsabeck added scope
class Survey < ActiveRecord::Base
  self.inheritance_column = nil
  #default_scope { order('created_at DESC') } # Sort by date created in descending order by default
  #scope :unpublished, -> { where(status: 'unpublished') }
  #scope :published, -> { where(status: 'published') }
  #scope :closed, -> {where(status: 'closed')}

  belongs_to :login
  has_many :user_surveys
  has_many :survey_questions

  accepts_nested_attributes_for :user_surveys
end
