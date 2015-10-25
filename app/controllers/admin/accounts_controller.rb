# Created by Brad Bilter, edited by Maxwell Barvian
class Admin::AccountsController < AdminController

  #Helper methods for sorting
  helper_method :sort_column, :sort_direction

  #index LOGINS but add order by to select for sorting
  def index
    @login = Login.order(sort_column + " " + sort_direction)
  end

  #Show users by ID selected
  def show
    @login = Login.find(params[:id])
  end

  def new
    @login = Login.new
  end

  #Selects existing user by selected ID to display
  def edit
    @login = Login.find(params[:id])
  end

  #Create new user with params hash
  def create
    @login = Login.new(login_params)
    @login.build_user
    #@login.user.update(general_opt_in: 0)
    #@login.user.update(email_opt_in: 0)
    #@login.user.update(phone_opt_in: 0)
    #@login.user.update(badges_opt_in: 0)

    # Test for save successful and react
    if @login.save
      flash[:success] = "Account created"
      redirect_to action: 'index'
    else
      flash[:alert] = "Account NOT created"
      render 'new'
    end
  end

  # Updates selected user received on submit from edit
  def update
    @login = Login.find(params[:id])

    #Test for save successful and react
    if @login.update(login_params.to_h.deep_reject { |k, v| ['password', 'password_confirmation'].include?(k) && v.blank? })
      flash[:success] = "Account updated"
      redirect_to :back
    else
      flash[:alert] = "Account NOT updated"
      render 'edit'
    end
  end

  # Delete records
  def destroy
    #Test for delete successful and react
    @login = Login.find(params[:id])
    if @login.destroy
      flash[:success] = "Account deleted"
    else
      flash[:alert] = "Account NOT deleted"
    end

    redirect_to :back
  end

  #Private methods
  private

  #Define login params to prevent sql injection
  #Active record has a permit only implementation
  #that means you must explicitly specify records
  #to be added
  def login_params
      params.require(:login).permit(:first_name, :middle_initial, :last_name, :username, :type, :created_at, :updated_at, :last_sign_in_at, :email, :password, :password_confirmation)
  end

  #sort column method that prevents sql injection
  #by only allowing sort columns to be received
  #from column headers ***railscast episode 228
  def sort_column
      Login.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  #sort direction method that prevents sql
  #injection by only allowing asc or desc
  #options to be passed for sort direction.
  #***railscast episode 228
  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
