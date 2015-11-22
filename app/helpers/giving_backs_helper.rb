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
    headers = {jobs: 'Submit an employment opportunity', internship: 'Submit an internship', mentoring: 'Request a mentorship', guest_speaking: 'Submit a speaking opportunity', other: 'Submit an opportunity' }
    headers[type.to_sym]
  end

    # Return an appropriate blurb for each opportunity type
  def blurb_for_giving_back_type(type)
    blurbs = {jobs: 'Post jobs relevant to our degree programs and help advance the careers of fellow North Central graduate students and alumni.', 
            internship: "Students in all Graduate Programs can now elect to participate in an internship for course credit. If you know of a possible internship or if your company is looking for graduate-level interns, you can submit an internship what will be available on this site and will be made available to our current graduate students.", 
            mentoring: "", 
            guest_speaking: "With a focus on bringing real-world experience into the classroom, we are constantly searching for guest speakers  and participants for panels, round-tables and seminars.  Please provide a brief explanation of a topic you'd wish to discuss, the format in which you prefer presenting, your availably and any time requirements. Additionally, please provide a brief overview of your professional qualifications.", 
            other: '' }
    blurbs[type.to_sym]
  end
  
  # Return the name of worker/admin who clicked on mark as contacted so you can tell who has contacted
  def id_to_name(id)
    login = Login.with_deleted.find(id)
    name = login.first_name.camelize +  " " + login.last_name.camelize
    return name
  end

end
