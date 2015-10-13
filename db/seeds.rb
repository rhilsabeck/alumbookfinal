# Created by Tessa
Login.destroy_all
Login.create!([
  {username: "wwworker", first_name: "worker", middle_initial: "w", last_name: "worker", type: 0, email: "worker@mail.com", password: "password", password_confirmation: "password", encrypted_password: "$2a$10$ENH/39txtGu1bp9p8lNfu.NlVluvqfNG38Wa.jJa.l2MIM7vEG4sO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-25 19:34:44", last_sign_in_at: "2015-05-25 19:34:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {username: "aaadmin", first_name: "admin", middle_initial: "a", last_name: "admin", type: 1, email: "admin@mail.com", password: "password", password_confirmation: "password", encrypted_password: "$2a$10$ENH/39txtGu1bp9p8lNfu.NlVluvqfNG38Wa.jJa.l2MIM7vEG4sO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-25 19:34:44", last_sign_in_at: "2015-05-25 19:34:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {username: "uuuser", first_name: "user", middle_initial: "u", last_name: "user", type: 2, email: "user@mail.com", password: "password", password_confirmation: "password", encrypted_password: "$2a$10$ENH/39txtGu1bp9p8lNfu.NlVluvqfNG38Wa.jJa.l2MIM7vEG4sO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-25 19:34:44", last_sign_in_at: "2015-05-25 19:34:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {username: "ggoak", first_name: "Gary", middle_initial: "G", last_name: "Oak", type: 2, email: "ggoak@hotmail.com", password: "password", password_confirmation: "password", encrypted_password: "$2a$10$a03e9EbiJbOZsXiC02DRIOTlKHa8XzJ3CwMoETd35ZKnua2RwnkIe", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-05-27 12:20:45", last_sign_in_at: "2015-05-27 11:49:45", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {username: "brpewter", first_name: "Brock", middle_initial: "R", last_name: "Pewter", type: 2, email: "brpewter@mail.com", password: "password", password_confirmation: "password", encrypted_password: "$2a$10$82J7W1lnoeY9Hq6euvWdAu3Fatzm/kZ8olwfPpqeARtwzxkmyzx3i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-27 18:13:50", last_sign_in_at: "2015-05-27 18:13:50", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])

#Ryan Hilsabeck corrected seeds for user with removal and additions of columns
User.destroy_all
User.create!([
  {login_id: 1, company_id: nil, street: "123 Front St", city: "Naperville", state: :IL, zip: 60504,  spouse_first_name: nil, spouse_middle_initial: nil, spouse_last_name: nil, number_children: nil, birth_day: nil, ethnicity: nil, general_opt_in: nil, email_opt_in: nil, phone_opt_in: nil, badges_opt_in: nil, status: nil, salary_range: nil, job_title: nil, start_date: nil, end_date: nil, searchable: nil, subscription_type: nil, program: nil},
  {login_id: 2, company_id: nil,  street: "345 Circle Dr", city: "Wheaton", state: :IL, zip: 60538,  spouse_first_name: nil, spouse_middle_initial: nil, spouse_last_name: nil, number_children: nil, birth_day: nil, ethnicity: nil, general_opt_in: nil, email_opt_in: nil, phone_opt_in: nil, badges_opt_in: nil, status: nil, salary_range: nil, job_title: nil, start_date: nil, end_date: nil, searchable: nil, subscription_type: nil, program: nil},
  {login_id: 3, company_id: nil,  street: "11212 Jefferson", city: "Sugar Grove", state: :IL, zip: 60554,  spouse_first_name: nil, spouse_middle_initial: nil, spouse_last_name: nil, number_children: nil,birth_day: nil, ethnicity: nil, general_opt_in: nil, email_opt_in: nil, phone_opt_in: nil, badges_opt_in: nil, status: nil, salary_range: nil, job_title: nil, start_date: nil, end_date: nil, searchable: nil, subscription_type: nil, program: nil},
  {login_id: 4, company_id: nil,  street: "232 Benton Ave", city: "Naperville", state: :IL, zip: 60540,  spouse_first_name: nil, spouse_middle_initial: nil, spouse_last_name: nil, number_children: nil, birth_day: nil, ethnicity: nil, general_opt_in: nil, email_opt_in: nil, phone_opt_in: nil, badges_opt_in: nil, status: nil, salary_range: nil, job_title: nil, start_date: nil, end_date: nil, searchable: nil, subscription_type: nil, program: nil},
  {login_id: 5, company_id: nil,  street: "493 Scottingham Dr", city: "Chicago", state: :IL, zip: 60542,  spouse_first_name: nil, spouse_middle_initial: nil, spouse_last_name: nil, number_children: nil, birth_day: nil, ethnicity: nil, general_opt_in: nil, email_opt_in: nil, phone_opt_in: nil, badges_opt_in: nil, status: nil, salary_range: nil, job_title: nil, start_date: nil, end_date: nil, searchable: nil, subscription_type: nil, program: nil}
])
Company.destroy_all
Company.create!([
  { company_name: "Google" },
  { company_name: "Facebook" },
  { company_name: "Yahoo" }
])
GivingBack.destroy_all
GivingBack.create!([
  {user_id: 3, company_id: nil, subject: "Guest Speaker", position: "QA", description: "I'd like to be a guest speaker", requirements: nil, approved: false, completed: false, type: 2, contact_first_name: "John", contact_last_name: "Doe", contact_email: "johndoe@gmail.com", hidden: false},
  {user_id: 3, company_id: nil, subject: "Tutor", position: "Tutor", description: "I'd like to tutor", requirements: nil, approved: false, completed: false, type: 1, contact_first_name: "Michael", contact_last_name: "Fassbender", contact_email: "michaelfassbender@yahoo.com", hidden: false}
])

# Survey seeds authored by: Brett Bush
Survey.destroy_all
Survey.create!([

  {login_id: 1, survey_name: "Short Answer Survey", survey_description: "A short answer survey regarding your travel experiences.", date_created: "2015-06-08", status: "published"},
  {login_id: 1, survey_name: "Single Choice Survey", survey_description: "A single choice survey about your Chicago baseball loyalty.", date_created: "2015-06-09", status: "published"},
  {login_id: 1, survey_name: "Multiple Choice Survey", survey_description: "A multiple choice survey about your favorite fruit.", date_created: "2015-06-09", status: "published"},
  {login_id: 1, survey_name: "Sub Questions Survey", survey_description: "A subquestion survey ranking Disney movies.", date_created: "2015-06-09", status: "published"},
  {login_id: 1, survey_name: "Big Survey", survey_description: "A big survey with multiple questions", date_created: "2015-06-09", status: "published"}
])
# SurveyQuestion seeds authored by: Brett Bush
SurveyQuestion.destroy_all
SurveyQuestion.create!([
  {survey_id: 1, type: "short_answer", display_order: 0, text: "Where was your favorite vacation?", required: false},
  {survey_id: 2, type: "single_choice", display_order: 0, text: "Cubs or Sox?", required: false},
  {survey_id: 3, type: "multi_choice", display_order: 0, text: "Select all fruits you like.", required: false},
  {survey_id: 4, type: "sub_questions", display_order: 0, text: "Rank these Pixar Movies from 1 (bad) to 4 (good).", required: false},
  {survey_id: 5, type: "short_answer", display_order: 0, text: "Where was your favorite vacation?", required: false},
  {survey_id: 5, type: "single_choice", display_order: 1, text: "Cubs or Sox?", required: false},
  {survey_id: 5, type: "multi_choice", display_order: 2, text: "Select all fruits you like.", required: false},
  {survey_id: 5, type: "sub_questions", display_order: 3, text: "Rank these Pixar Movies from 1 to 4.", required: false}
])
# SurveyQuestionOption seeds authored by: Brett Bush
SurveyQuestionOption.destroy_all
SurveyQuestionOption.create!([
  {survey_question_id: 2, display_order: 0, text: "Cubs"},
  {survey_question_id: 2, display_order: 1, text: "Sox"},
  {survey_question_id: 3, display_order: 0, text: "Apple"},
  {survey_question_id: 3, display_order: 1, text: "Banana"},
  {survey_question_id: 3, display_order: 2, text: "Orange"},
  {survey_question_id: 3, display_order: 3, text: "Watermelon"},
  {survey_question_id: 4, display_order: 0, text: "1"},
  {survey_question_id: 4, display_order: 1, text: "2"},
  {survey_question_id: 4, display_order: 2, text: "3"},
  {survey_question_id: 4, display_order: 3, text: "4"},
  {survey_question_id: 6, display_order: 0, text: "Cubs"},
  {survey_question_id: 6, display_order: 1, text: "Sox"},
  {survey_question_id: 7, display_order: 0, text: "Apple"},
  {survey_question_id: 7, display_order: 1, text: "Banana"},
  {survey_question_id: 7, display_order: 2, text: "Orange"},
  {survey_question_id: 7, display_order: 3, text: "Watermelon"},
  {survey_question_id: 8, display_order: 0, text: "1 (bad)"},
  {survey_question_id: 8, display_order: 1, text: "2"},
  {survey_question_id: 8, display_order: 2, text: "3"},
  {survey_question_id: 8, display_order: 3, text: "4 (good)"}
])
# SurveyQuestionOptionsChocie seeds authored by: Brett Bush
SurveyQuestionOptionsChoice.destroy_all
SurveyQuestionOptionsChoice.create!([
  {survey_question_id: 4, display_order:0, text: "Toy Story"},
  {survey_question_id: 4, display_order:1, text: "WALL-E"},
  {survey_question_id: 4, display_order:2, text: "Up"},
  {survey_question_id: 8, display_order:0, text: "Toy Story"},
  {survey_question_id: 8, display_order:1, text: "WALL-E"},
  {survey_question_id: 8, display_order:2, text: "Up"}
])
# UserSurvey seeds authored by: Brett Bush
UserSurvey.destroy_all
UserSurvey.create!([
  {user_id: 3, survey_id: 1, date_completed: "2015-06-08", anonymous: false},
  {user_id: 3, survey_id: 2, date_completed: "2015-06-09", anonymous: false},
  {user_id: 4, survey_id: 2, date_completed: "2015-06-09", anonymous: false},
  {user_id: 3, survey_id: 3, date_completed: "2015-06-09", anonymous: false},
  {user_id: 4, survey_id: 3, date_completed: "2015-06-09", anonymous: false},
  {user_id: 5, survey_id: 3, date_completed: "2015-06-09", anonymous: false},
  {user_id: 4, survey_id: 4, date_completed: "2015-06-09", anonymous: false},
  {user_id: 3, survey_id: 5, date_completed: "2015-06-09", anonymous: false},
  {user_id: 4, survey_id: 5, date_completed: "2015-06-09", anonymous: false}
])
# UserSurveyResponse seeds authored by: Brett Bush
UserSurveyResponse.destroy_all
UserSurveyResponse.create!([
  {user_survey_id: 1, survey_question_id: 1, survey_question_option_id: nil, survey_question_options_choice_id: nil, response_text: "Walt Disney World in Orlando Florida"},
  {user_survey_id: 2, survey_question_id: 2, survey_question_option_id: 2, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 3, survey_question_id: 2, survey_question_option_id: 1, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 4, survey_question_id: 3, survey_question_option_id: 3, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 4, survey_question_id: 3, survey_question_option_id: 5, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 5, survey_question_id: 3, survey_question_option_id: 6, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 6, survey_question_id: 3, survey_question_option_id: 3, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 6, survey_question_id: 3, survey_question_option_id: 4, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 6, survey_question_id: 3, survey_question_option_id: 5, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 6, survey_question_id: 3, survey_question_option_id: 6, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 7, survey_question_id: 4, survey_question_option_id: 7, survey_question_options_choice_id: 1, response_text: nil},
  {user_survey_id: 7, survey_question_id: 4, survey_question_option_id: 8, survey_question_options_choice_id: 2, response_text: nil},
  {user_survey_id: 7, survey_question_id: 4, survey_question_option_id: 10, survey_question_options_choice_id: 3, response_text: nil},
  {user_survey_id: 8, survey_question_id: 5, survey_question_option_id: nil, survey_question_options_choice_id: nil, response_text: "The Wisconsin Dells"},
  {user_survey_id: 8, survey_question_id: 6, survey_question_option_id: 11, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 8, survey_question_id: 7, survey_question_option_id: 14, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 8, survey_question_id: 7, survey_question_option_id: 16, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 8, survey_question_id: 8, survey_question_option_id: 20, survey_question_options_choice_id: 4, response_text: nil},
  {user_survey_id: 8, survey_question_id: 8, survey_question_option_id: 17, survey_question_options_choice_id: 5, response_text: nil},
  {user_survey_id: 8, survey_question_id: 8, survey_question_option_id: 19, survey_question_options_choice_id: 6, response_text: nil},
  {user_survey_id: 9, survey_question_id: 5, survey_question_option_id: nil, survey_question_options_choice_id: nil, response_text: "San Francisco"},
  {user_survey_id: 9, survey_question_id: 6, survey_question_option_id: 12, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 9, survey_question_id: 7, survey_question_option_id: 14, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 9, survey_question_id: 7, survey_question_option_id: 13, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 9, survey_question_id: 7, survey_question_option_id: 15, survey_question_options_choice_id: nil, response_text: nil},
  {user_survey_id: 9, survey_question_id: 8, survey_question_option_id: 19, survey_question_options_choice_id: 4, response_text: nil},
  {user_survey_id: 9, survey_question_id: 8, survey_question_option_id: 18, survey_question_options_choice_id: 5, response_text: nil},
  {user_survey_id: 9, survey_question_id: 8, survey_question_option_id: 20, survey_question_options_choice_id: 6, response_text: nil}
])
