# Created by Leiyang Guo(a few additions by Ryan Hilsabeck)
# With minimal assistance and advice with James Maher
# Helper containing helper methods for Searchusers
module SearchusersHelper
  # Set fields to be searched and displayed
  def model_fields
    # Which fields to display and sort by
    [:first_name, :last_name, :email]
  end
  
  # Debugging method for checking sql call
  def display_query_sql(users)
    "SQL: #{users.to_sql}"
  end
  
  # Set action "basic_search" with method post and get
  def action
    action_name == 'basic_search' ? :post : :get
  end
  
  # Display all search results for a basic search
  # Profile image will be retrieved from assets/images/user_img file
  # No profile image should be saved in any other format besides .jpg 
  def display_basic_search_results(objects)
    objects.each_with_object('') do |object, string|
      string << content_tag(:div, content_tag(:div, content_tag(:div, content_tag(:div, tag("img", src: User.find(object.send(:id)).avatar.url(:full), class: "profile-avatar"), class: "row") + display_basic_search_results_row(object), class: ["large-3", "small-3", "columns"], align: "center") + content_tag(:div, "",class: ["large-1", "small-1", "columns"])))#code        
    end
  end
  #Ryan Hilsabeck added correct paths for links to user profiles and also removed email for now to control opt out
  # Return and display search result for specific user object passed in,
  # Then show the information in a block
  def display_basic_search_results_row(object)
    model_fields.each_with_object('') do |field, string|
      if model_fields.find_index(field) == 0
        string << content_tag(:div,link_to(object.send(field), user_path(object.user), :style=>'color:#0011CC;'), class: "row")
      elsif model_fields.find_index(field) == 1
        string << content_tag(:div, link_to(object.send(field), user_path(object.user), :style=>'color:#0011CC;'), class: "row")
      else
        #string << content_tag(:div, "Email: " + (object.send(field) if object.user.email_opt_in = 1), class: "row")
      end
    end
    .html_safe
  end
end



