#Created by Tessa, Modified by Victor, Jeff, Max
class UserSurveyResponse < ActiveRecord::Base
  acts_as_paranoid
  self.inheritance_column = nil
  belongs_to :user_survey
  belongs_to :survey_question
  belongs_to :survey_question_option
  belongs_to :survey_question_options_choice

  validates :response_text, presence: true, if: :should_validate_response_text
  validates :survey_question_option, presence: true, if: :should_validate_survey_question_option
  

  accepts_nested_attributes_for :survey_question_option
  accepts_nested_attributes_for :survey_question_options_choice

  def should_validate_response_text
    survey_question.type == 'short_answer' && survey_question.required?
  end

  def should_validate_survey_question_option
    ['single_choice', 'multi_choice'].include?(survey_question.type) && survey_question.required?
  end

end
