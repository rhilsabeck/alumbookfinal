# author: Maxwell Barvian
class GivingBacksController < AuthenticatedController
  # Creates an action to use for the autocomplete Company textfield
  autocomplete :company, :name, column_name: 'company_name'

  def new
    # Create an empty opportunity with the type from the URL
    @opportunity = GivingBack.new(type: GivingBack.types.has_key?(params[:type]) ? params[:type] : 'other')
  end

  def create
    @opportunity = GivingBack.new(opportunity_params)
    # Assign the user to the current login
    @opportunity.user = current_login.user
    # Check if a company with the givne name already exists, and if so,
    # use it instead
    @opportunity.company &&= Company.find_by(company_name: @opportunity.company.company_name) || @opportunity.company

    if @opportunity.save
      # flash[:success] = "Opportunity submitted!"
      render 'submitted'
    else
      render 'new'
    end
  end

  private

  def opportunity_params
    params.require(:giving_back).permit(:type, :subject, :position,
      :requirements, :description, :url,
      :contact_first_name, :contact_last_name, :contact_email,
      company_attributes: [:company_name]
    )
  end
end
