# author: Brett Bush

class ReportController < AuthenticatedController

  # Display: views/report/index.html.erb
  def index
  end

  # Display: views/report/show.html.erb
  #      or  views/report/show.xml.erb
  def show

    # Obtain the selected report id and name of index.html.erb form
    @report_id = params[:report_id]
    @report_name = params[:report_name]
    @saved_list_array = Login.find(current_login.id).saved_lists

    # Switch case by report_id
    case @report_id

    # (1) Date Entered Report
    when "1"

      # Obtain selected month, year, and saved list to run report on
      @month = params[:month_entered]
      @year = params[:year_entered]
      @saved_list_type = params[:saved_list_type]

      # No month or year selected
      if(@month == "" && @year == "")

        # Obtain all Users
        if(@saved_list_type == "")
          @users = User.all

        # Obtain all Users on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').all
        end

      # Only year selected
      elsif(@month == "" && @year != "")

        # Create temporary date with selected year
        @temp_date = Date.parse(@year + '-01-01')

        # Obtain all Users created in selected year
        if(@saved_list_type == "")
          @users = User.where("YEAR(users.created_at) = ?", @temp_date.year)

        # Obtain all Users created in selected year on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').where("YEAR(users.created_at) = ?", @temp_date.year)
        end

      # Only month selected
      elsif(@month != "" && @year == "")

        # Create temporary date with selected month
        @temp_date = Date.parse('2015-' + @month.rjust(2, '0') + '-01')

        # Obtain all Users created in selected month
        if(@saved_list_type == "")
          @users = User.where("MONTH(created_at) = ?", @temp_date.month)

        # Obtain all Users created in selected month on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').where("MONTH(users.created_at) = ?", @temp_date.month)
        end

      # Month and year selected
      else

        # Create temporary date with selected month and year
        @temp_date = Date.parse(@year + '-' + @month.rjust(2, '0') + '-01')

        # Obtain all Users created in selected month and year
        if(@saved_list_type == "")
          @users = User.where("YEAR(created_at) = ? and MONTH(created_at) = ?", @temp_date.year, @temp_date.month)

        # Obtain all Users created in selected month and year on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').where("YEAR(users.created_at) = ? and MONTH(users.created_at) = ?", @temp_date.year, @temp_date.month)
        end
      end

    # (2) Graduation Class Year Report
    when "2"

      # Obtain selected year and saved list to run report on
      @year = params[:year_graduated]
      @saved_list_type = params[:saved_list_type]

      # No year selected
      if(@year == "")

        # Obtain all Users
        if(@saved_list_type == "")
          @users = User.all

        # Obtain all Users on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').all
        end

      # Year selected
      else

        # Create temporary date with selected year
        @temp_date = Date.parse(@year + '-01-01')

        # Obtain all Users by NCC grad program graduating class year
        if(@saved_list_type == "")
          @users = User.joins('INNER JOIN graduate_degrees ON graduate_degrees.user_id = users.id').joins('INNER JOIN colleges ON graduate_degrees.college_id = colleges.id').where("YEAR(graduate_degrees.graduation_date) = ? and colleges.college_name = ?", @temp_date.year, 'North Central College')

        # Obtain all Users by NCC grad program graduating class year on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').joins('INNER JOIN graduate_degrees ON graduate_degrees.user_id = users.id').joins('INNER JOIN colleges ON graduate_degrees.college_id = colleges.id').where("YEAR(graduate_degrees.graduation_date) = ? and colleges.college_name = ?", @temp_date.year, 'North Central College')
        end
      end

    # (3) Graduate Degree Program Report
    when "3"

      # Obtain selected NCC graduate program and saved list to run report on
      @program_degree_id = params[:program_select]
      @saved_list_type = params[:saved_list_type]

      # No program selected
      if(@program_degree_id == "")

        # Obtain all Users
        if(@saved_list_type == "")
          @users = User.all

        # Obtain all Users on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').all
        end

      # Program selected
      else

        # Obtain all Users in this NCC program
        if(@saved_list_type == "")
          @users = User.where('users.program = ?', @program_degree_id)

        # Obtain all Users in this NCC program on selected saved list
        else
          @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').where('users.program = ?', @program_degree_id)
        end
      end

    # (4) Employer Name Report
    when "4"

      # Obtain entered employer name and selected saved list to run report on
      @employer_name = params[:employer_name]
      @saved_list_type = params[:saved_list_type]

      # Obtain all Users
      if(@saved_list_type == "")
        @users = User.joins('INNER JOIN companies ON companies.id = users.company_id').where('companies.company_name = ?', @employer_name)

      # Obtain all Users on selected saved list
      else
        @users = User.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').joins('INNER JOIN companies ON companies.id = users.company_id').where('companies.company_name = ?', @employer_name)
      end

    # (5) Survey Taken Report
    when "5"

      # Obtain selected survey and saved list to run report on
      @survey_id = params[:survey_select]
      @saved_list_type = params[:saved_list_type]

      # No survey selected
      if(@survey_id == "")

        # Obtain all Users who have taken a survey
        if(@saved_list_type == "")
          @users = User.with_deleted.joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id')

        # Obtain all Users who have taken a survey on selected saved list
        else
          @users = User.with_deleted.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id')
        end

      # Survey selected
      else

        # Obtain all Users who have taken selected survey
        if(@saved_list_type == "")
          @users = User.with_deleted.joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id').where('user_surveys.survey_id = ?', @survey_id)

        # Obtain all Users who have taken selected survey on selected saved list
        else
          @users = User.with_deleted.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id').where('user_surveys.survey_id = ?', @survey_id)
        end
      end

    # (6) Users Giving Back Report
    when "6"

      # Obtain selected saved list to run report on
      @saved_list_type = params[:saved_list_type]

      # Obtain all Users who have given back
      if(@saved_list_type == "")
        @users = User.with_deleted.joins('INNER JOIN giving_backs ON giving_backs.user_id = users.id').where('giving_backs.contacted = ? OR giving_backs.approved = ?', true, true).distinct

      # Obtain all Users who have given back on selected saved list
      else
        @users = User.with_deleted.joins('INNER JOIN saved_list_users ON saved_list_users.user_id = users.id').joins('INNER JOIN giving_backs ON giving_backs.user_id = users.id').where('giving_backs.contacted = ? OR giving_backs.approved = ?', true, true).distinct
      end

    # (7) Survey Results
    when "7"

      # Obtain selected survey to run report on
      @survey_id = params[:survey_select]
      @survey = Survey.find(@survey_id)

      # Obtain survey questions of selected survey in display order
      @survey_questions = SurveyQuestion.where('survey_id = ?', @survey.id).order('display_order ASC')

      # Obtain all Users who have taken this survey
      @users = User.with_deleted.joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id').where('user_surveys.survey_id = ?', @survey_id)

    # (8) User Survey Results
    when "8"

      # Obtain selected survey to run report on
      @survey_id = params[:survey_select]
      @survey = Survey.find(@survey_id)

      @username = params[:user_name]

      # Obtain survey questions of selected survey in display order
      @survey_questions = SurveyQuestion.where('survey_id = ?', @survey.id).order('display_order ASC')

      # Obtain all Users who have taken this survey
      @users = User.with_deleted.joins('INNER JOIN user_surveys ON user_surveys.user_id = users.id').joins('INNER JOIN logins ON logins.id = users.login_id').where('user_surveys.survey_id = ? and logins.username = ?', @survey_id, @username)

    # (?) Unknown Report
    else
      # Do nothing
    end

    # Account for HTML or XLS page
    respond_to do |format|
      format.html do
        # Do nothing
      end
      format.xls do

        # Create file name from: report name and current datetime, downcasing it, adding .xls extension, and replace all invalid file name characters with underscores (including spaces)
        headers["Content-Disposition"] = "attachment; filename=\"" + @report_name.downcase.gsub(/[\x00\/\\:\*\?\"<>\| ]/, '_') + "_report_" + DateTime.now.strftime("%m%d%Y_%I%M%p") + ".xls\""

      end
    end
  end
end
