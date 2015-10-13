# Created by Tim Schneider and Maxwell Barvian
class UserController < AuthenticatedController
  before_filter :redirect_admins!, only: :index
  before_filter lambda{ unauthorized() unless current_login.authorized_to_show_profile? params[:id].to_i }, only: :show
  before_filter lambda{ unauthorized() unless current_login.authorized_to_edit_profile? params[:id].to_i }, only: [:edit, :update, :destroy_avatar]

  # Creates an action to use for the autocomplete Company textfield
  autocomplete :company, :name, column_name: 'company_name'

  # Index to user profile page
  def index
    @user = current_login.user
    render 'show'
  end

  # Show method for the user profile page
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    profile = user_params.to_h

    company_name = profile['company_attributes']['company_name']
    if company_name.empty?
      profile.delete('company_attributes')
    else
      if company = Company.find_by(company_name: company_name)
        # Re-link previous info if already configured
        @user.company.company_info.company = company if @user.company.company_info
        # Link new company
        @user.company = company
        # Update params accordingly
        profile['company_attributes']['id'] = company.id
      end
    end

    if @user.update(profile.deep_reject { |k, v| ['password', 'password_confirmation'].include?(k) && v.blank? })
      flash[:success] = "Profile updated."
      redirect_to action: 'show'
    else
      flash[:alert] = "Your profile could not be updated."
      redirect_to :back
    end

  end

  def avatar
    @user = User.find(params[:id])
    @user.avatar = nil
    @user.save

    flash[:success] = "Avatar removed."
    redirect_to :back
  end

  private

  def redirect_admins!
    redirect_to '/admin/accounts#index' if current_login.worker? || current_login.admin?
  end

  def user_params
    # Lord give me strength
    params.require(:user).permit(
      :avatar, :street, :city, :state, :zip, :spouse_first_name, :spouse_middle_initial,
      :spouse_last_name, :number_children, :birth_day, :ethnicity,
      :general_opt_in, :email_opt_in, :phone_opt_in, :searchable,
      :status, :salary_range, :job_title, :start_date, :end_date, :program,
      login_attributes: [
        :id, :first_name, :middle_initial, :last_name,
        :username, :email, :password, :password_confirmation
      ],
      user_phones_attributes: [:id, :country_code, :area_code, :prefix, :suffix, :extension, :type, :_destroy],
      undergraduate_degrees_attributes: [:id, :graduation_date, :_destroy,
        degree_attributes: [:id, :major_name, :type],
        college_attributes: [:id, :college_name]
      ],
      graduate_degrees_attributes: [:id, :graduation_date, :status, :_destroy,
        degree_attributes: [:id, :major_name, :type],
        college_attributes: [:id, :college_name]
      ],
      company_attributes: [:id, :company_name,
        company_info_attributes: [:id, :street, :city, :state, :zip, :country_code, :area_code, :prefix, :suffix]
      ]
    )
  end


end
