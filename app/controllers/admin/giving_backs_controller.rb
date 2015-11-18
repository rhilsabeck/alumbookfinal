# Author: Maxwell Barvian 
# Ryan Hilsabeck also added below to show deleted users giving backs still
class Admin::GivingBacksController < AdminController
  def index
    @allopps = GivingBack.with_deleted
    @opportunities = @allopps.pending
  end

  def contacted
    @allopps = GivingBack.with_deleted
    @opportunities = @allopps.contacted
    render 'index'
  end

  def approved
    @opportunities = archive_internship_job
    render 'index'
  end

  def archived
    @allopps = GivingBack.with_deleted
    @opportunities = @allopps.archived
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

  #Ryan Hilsabeck added this method to archive jobs/internships that are past the archived date
  def archive_internship_job
    @allopps = GivingBack.with_deleted
    @approved_jobs_internships = @allopps.approved
    current_jobs_internships = Array.new
    @approved_jobs_internships.each do |o|
      if o.archive_on.nil? || (o.archive_on > DateTime.now)
        current_jobs_internships.push (o)
      else
        o.update_attribute(:hidden, true)
      end
    end
    return current_jobs_internships
  end

end
