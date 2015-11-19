# Created by Leiyang Guo
# With minimal assistance and advice with James Maher
# Searchusers controller
# This file contains the controller for Searchusers in view folder
class SearchusersController < ApplicationController
  # GET /searchusers
  # GET /searchusers.json
  
  # Define Searchusers/index.html.erb actions
  def index
    # Set showResult to false upon first time click search to hide search header
    @showResult = false
    
    # Shows result if something is been searched
    if !(params[:q].blank?)
      @showResult = true
    end
    
    # Check database for a matching user
    #@search = Login.joins('LEFT OUTER JOIN users ON users.login_id = logins.id').search(params[:q])
    
    #uncomment code below if searchable attribute is FUNCTIONAL
    #@search = Login.joins('LEFT OUTER JOIN users ON users.login_id = logins.id').where("users.general_opt_in = 1").search(params[:q])
    @search =Login.joins(:user).search(params[:q])
    @searchusers = @search.result.where('general_opt_in = 1')
  end
  

end