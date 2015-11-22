module SurveyAdminHelper

# Return the name of worker/admin who clicked on mark as contacted so you can tell who has contacted
  def id_to_name(id)
    login = Login.with_deleted.find(id)
    name = login.first_name.camelize +  " " + login.last_name.camelize
    return name
  end
end
