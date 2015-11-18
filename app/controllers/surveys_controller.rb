#Survey_Controller created by Jeffrey Mayer, edited by Maxwell Barvian and by Ryan Hilsabeck
#Everything related to Survey was created by Jeffrey Mayer
#This is not fully complete. Need to implement javascreipt to allow
#for only showing one question at a time and proper form submission.
class SurveysController < AuthenticatedController
  def index   
    @surveys = surveys_user_has_not_taken
  end

  # Take a survey. creates base survey and loads in partial for each question
  def show
    @survey = Survey.find(params[:id])
    @usersurvey = @survey.user_surveys.build

    unless @survey && @survey.status == 'published'
      flash[:alert] = "Survey not found."
      redirect_to action: 'index'
    end
  end

  def create
    @usersurvey = UserSurvey.new(user_survey_params)
    @usersurvey.user = current_login.user
    @usersurvey.date_completed = Date.today

    if @usersurvey.save
      flash[:success] = "Survey completed."
      redirect_to action: 'index'
    else
      render 'show'
    end
  end

  private

  def user_survey_params
    params.require(:user_survey).permit(
      :survey_id, :user_id,
      user_survey_responses_attributes: [:id,
        :survey_question_id,
        :survey_question_option_id,
        :response_text
      ]
    )
  end

  #Method to get surveys that user has not taken yet(Create by Ryan Hilsabeck)
  def surveys_user_has_not_taken
    @pub_surveys = Survey.select('id').where(status: 'published')
    @pub_survey_ids = Array.new

    @pub_surveys.each do |u|
      @pub_survey_ids.push (u.id)
    end
       
    @user_taken_surveys = UserSurvey.where(user_id: current_login)
    @user_taken_survey_ids = Array.new

    @user_taken_surveys.each do |u|
      @user_taken_survey_ids.push (u.survey_id)
    end

    @untaken_pub_surveys_ids = Array.new

    @pub_survey_ids.each do |u|
    if @user_taken_survey_ids.index(u)
      puts "it exists"
    else
      @untaken_pub_surveys_ids.push (u)
    end
    end

    @untaken_pub_surveys = Survey.where("id IN (?)", @untaken_pub_surveys_ids)
  end

end
