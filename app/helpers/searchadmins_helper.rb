# Created by Leiyang Guo( a few additions by Ryan Hilsabeck)
# With minimal assistance and advice with James Maher
# Helper containing helper methods for Searchadmins
module SearchadminsHelper
  # Helper creating an add field button with functionality implemented by coffeescript
  def link_to_add_fields(name, f, type, locals={})
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields " + locals[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  # Set fields to be searched and displayed
  def model_fields
    # Which fields to display and sort by
    [:first_name, :last_name, :email]
  end
  
  # Debugging method for checking sql call
  def display_query_sql(users)
    "SQL: #{users.to_sql}"
  end
  
  # Set action "advanced_search" with method post and get
  def action
    action_name == 'advanced_search' ? :post : :get
  end
  
  # Display result header with active sorting link
  def display_sort_column_headers(search)
    model_fields.each_with_object('') do |field, string|
      string << content_tag(:th, sort_link(search, field, {}, method: action))
    end
  end
  
  # Display all search results for an advanced search
  def display_search_results(objects)
    objects.each_with_object('') do |object, string|
      string << content_tag(:tr, display_search_results_row(object))
    end
  end
  # Ryan Hilsabeck added correct link_to user path and style to both name and email to link to users profile
  # Return and display search result in specific row with links to user profiles
  def display_search_results_row(object)
    # Store variable for saved list
    session[:sResult].push(object.id)
    
    fieldCount = 0
    model_fields.each_with_object('') do |field, string|
      if fieldCount == 0
        string << content_tag(:td, link_to(object.send(field), user_path(object.user), :style=>'color:#0011CC;'))#code
      else
        string << content_tag(:td, link_to(object.send(field), user_path(object.user), :style=>'color:#0011CC;'))
      end
      
      fieldCount += 1
      # button to link to profile link_to
    end
    .html_safe
  end
end

# http://stackoverflow.com/questions/14531426/how-can-i-save-ransack-searches-to-the-database


