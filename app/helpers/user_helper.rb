module UserHelper

  def giving_back_jobs_internships(id)
    jobs_internships = GivingBack.where(["user_id = ? and approved = ? and hidden = ?", id, true, false])
    if jobs_internships.nil?
      count = 0
    else
    count = jobs_internships.count
    end
    return count
  end

   #Method to get surveys that user has not taken yet(Create by Ryan Hilsabeck)
  def survey_count
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

    if @untaken_pub_surveys_ids.empty?
      count = 0
    else
     count = @untaken_pub_surveys_ids.count
    end
    return count
  end

  # Ryan Hilsabeck additions from alumbook2. Helper methods for User information 
  # helper method to concatenate the elements of the phone number into
  # a string
  def concatenate_phone (phone_country_code, phone_area_code,
                         phone_prefix, phone_suffix)
    phone_text = " "
    if phone_area_code.present? and phone_prefix.present? and phone_suffix.present?
      phone_text = (phone_area_code.to_s + "." +
                    phone_prefix.to_s + "." + phone_suffix.to_s)
      if phone_country_code.present?
        phone_text = phone_country_code.to_s + "." + phone_text
      end
    end
    return phone_text
  end

  # helper method to convert user.status from number stored in tables
  # to verbiage
  def convert_user_status_to_words (status_num)
    #status_num = "#{status_num}"
    if status_num == 1
      status_text = "Currently Enrolled"
    elsif status_num == 0
      status_text = "Alumni"
    end
  end

  # helper method to convert opt_in_values from number stored in tables
  # to true/false
  def convert_opt_in_to_true_false (opt_in_value_num)
    if opt_in_value_num == 0
      opt_in_boolean = false
    elsif opt_in_value_num == 1
      opt_in_boolean = true
    end
  end

  # helper method to convert opt_in_values from number stored in tables
  # to CHECKED or ""
  def convert_opt_in_to_value_for_input_type (opt_in_value_num)
    if opt_in_value_num == 0
      opt_in_value = " "
    elsif opt_in_value_num
      opt_in_value = " CHECKED "
    end
  end

  # helper method to convert opt_in_values from number stored in tables
  # to in or out
  def convert_opt_in_to_words (opt_in_value_num)
    if opt_in_value_num == 0
      opt_in_text = "no"
    elsif opt_in_value_num
      opt_in_text = "yes"
    end
    return opt_in_text
  end


  # helper method to convert salary_range from number stored in tables
  # to verbiage
  def convert_salary_range_to_words (salary_range_num)
    if salary_range_num == 0
      salary_range_text = "< $ 49,000"
    elsif salary_range_num == 1
      salary_range_text = "$ 50,000 to $ 99,000"
    elsif salary_range_num == 2
      salary_range_text = "$ 100,000 to $ 149,000"
    elsif salary_range_num == 3
      salary_range_text = "$ 150,000 to $ 199,000"
    else salary_range_num == 4
      salary_range_text = "> $ 200,000"
    end
  end

  # helper method to convert degree_type from number stored in tables
  # to verbiage(Ryan HIlsabeck added more degrees)
  def convert_degree_type (degree_type_num)
      degree_type_num = "#{degree_type_num}"
    case degree_type_num
      when "aa"
        convert_degree_text = "Associate of Arts (A.A)"
      when "as"
        convert_degree_text = "Associate of Science (A.S.)"
      when "ba"
        convert_degree_text = "Bachelor of Arts (B.A.)"
      when "bs"
        convert_degree_text = "Bachelor of Science (B.S)"
      when "ma"
        convert_degree_text = "Master of Arts (M.A.)"
      when "ms"
        convert_degree_text = "Master of Science (M.S.)"
      when "phd"
        convert_degree_text = "Doctoral (Ph.D.)"
      when "md"
        convert_degree_text = "Medical Doctor (M.D.)"
      when "mph"
        convert_degree_text = "Master of Public Health (M.P.H)"
      when "mpa"
        convert_degree_text = "Master of Public Adminstration (M.P.A)"
      when "jd"
        convert_degree_text = "Juris Doctor (J.D)"
      when "mfa"
        convert_degree_text = "Master of Fine Arts (M.F.A)"
      when "mms"
        convert_degree_text = "Master of Music (M.M.S)"
      when "me"
        convert_degree_text = "Master of Engineering (M.E.)"
      when "mlis"
        convert_degree_text = "Master of Library Science (M.L.I.S)"
      when "msw"
        convert_degree_text = "Master of Social Work (M.S.W)"
      when "med"
        convert_degree_text = "Master of Education (M.Ed)"
      when "mba"
        convert_degree_text = "Master of Business Administration (M.B.A)"
      else
        convert_degree_text = "Best Degree Ever"
    end
  end



     # Method to convert user.status from text to a number
    def convert_user_status_to_number (status_text)
      if status_text == "Currently Enrolled"
        status_num = 0
      elsif status_text == "Alumni"
        status_num = 1
      end
    end

    # Method to convert salary_range from words to a number
    def convert_salary_range_to_number (salary_range_text)
      if salary_range_text == "< $ 49,000"
        salary_range_num = 0
      elsif salary_range_text == "$ 50,000 to $ 99,000"
        salary_range_num = 1
      elsif salary_range_text == "$ 100,000 to $ 149,000"
        salary_range_num = 2
      elsif salary_range_text == "$ 150,000 to $ 199,000"
        salary_range_text_num = 3
      else salary_range_text == "> $ 200,000"
        salary_range_num = 4
      end
    end

  # helper method to get photo_path if it exists,
  # otherwise get the default photo_path
  def get_photo_path (id_num)
    photo_file_name = "user_image_ " + id_num.to_s
    photo_path_and_file_name = Rails.root.join "app", "assets", "images",
                                                              photo_file_name
    if (File.file?(photo_path_and_file_name + ".bmp"))
      asset_name = "/assets/" + photo_file_name + ".bmp"
    elsif (File.file?(photo_path_and_file_name + ".gif"))
      asset_name = "/assets/" + photo_file_name + ".gif"
    elsif (File.file?(photo_path_and_file_name + ".jpg"))
      asset_name = "/assets/" + photo_file_name + ".jpg"
    elsif (File.file?(photo_path_and_file_name + ".jpeg"))
      asset_name = "/assets/" + photo_file_name + ".jpeg"
    elsif (File.file?(photo_path_and_file_name + ".png"))
      asset_name = "/assets/" + photo_file_name + ".png"
    elsif (File.file?(photo_path_and_file_name + ".tiff"))
      asset_name = "/assets/" + photo_file_name + ".tiff"
    else
      asset_name = "/assets/placeholder-person.png"
    end
    return asset_name
  end
end
