# Author: Maxwell Barvian & Ryan Hilsabeck(last method)
module GivingBacksHelper
  # Return an appropriate icon name for each opportunity type
  def icon_for_giving_back_type(type)
    icons = { jobs: 'shopping-bag', internship: 'shopping-bag', mentoring: 'torsos', guest_speaking: 'projection-screen', other: 'info' }
    icons[type.to_sym]
  end

  # Return an appropriate label for each opportunity type
  def humanize_giving_back_type(type)
    humanized_types = {jobs: 'Job', internship: 'Internship', mentoring: 'Mentoring', guest_speaking: 'Speaking', other: 'Other' }
    humanized_types[type.to_sym]
  end

  # Return an appropriate article + name for each opportunity type
  def header_for_giving_back_type(type)
    headers = {jobs: 'a job', internship: 'an internship', mentoring: 'a mentoring opportunity', guest_speaking: 'a speaking opportunity', other: 'an opportunity' }
    headers[type.to_sym]
  end
  
  # Return the name of worker/admin who clicked on mark as contacted so you can tell who has contacted
  def id_to_name(id)
    login = Login.with_deleted.find(id)
    name = login.first_name.camelize +  " " + login.last_name.camelize
    return name
  end

end
