class AddDeletedAtToUserSurveyResults < ActiveRecord::Migration
  def change
    add_column :user_survey_responses, :deleted_at, :datetime
    add_index :user_survey_responses, :deleted_at, where: "deleted_at IS NULL"
  end
end
