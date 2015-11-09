# Author: Maxwell Barvian
class Admin::GivingBacksController < AdminController
  def index
    @opportunities = GivingBack.pending
  end

  def contacted
    @opportunities = GivingBack.contacted
    render 'index'
  end

  def approved
    @opportunities = GivingBack.approved
    render 'index'
  end

  def archived
    @opportunities = GivingBack.archived
    render 'index'
  end

  def update
    @opportunity = GivingBack.find(params[:id])

    if @opportunity.update(opportunity_params)
      flash[:success] = "Opportunity updated."
    else
      flash[:alert] = "The opportunity could not be updated."
    end

    redirect_to :back
  end

  def destroy
    @opportunity = GivingBack.find(params[:id])
    @opportunity.destroy()

    flash[:success] = "Opportunity deleted."
    redirect_to :back
  end

  private

  def opportunity_params
    params.require(:giving_back).permit(:approved, :contacted, :hidden, :contacted_by)
  end

end
