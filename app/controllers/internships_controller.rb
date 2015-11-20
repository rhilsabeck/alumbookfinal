# Author: Maxwell Barvian 
# Ryan Hilsabeck added methods to see if internship/job has past it's archive date and to archive it
class InternshipsController < AuthenticatedController
  def index
    @opportunities = archive_job
  end

  def internship
    @opportunities = archive_internship
    render 'index'
  end


  private

  def archive_internship
     @allInternships = GivingBack.internship.where(approved: true, hidden: false)
    current_giving_backs = Array.new
    @allInternships.each do |o|
      if o.archive_on.nil? || (o.archive_on > DateTime.now)
        current_giving_backs.push (o)
      else
      	o.update_attribute(:hidden, true)
      end
    end
    return current_giving_backs
  end

  def archive_job
     @allJobs = GivingBack.jobs.where(approved: true, hidden: false)
     current_giving_backs = Array.new
     @allJobs.each do |o|
      if o.archive_on.nil? || (o.archive_on > DateTime.now)
        current_giving_backs.push (o)
      else
      	o.update_attribute(:hidden, true)
      end
    end
    return current_giving_backs
  end
end
