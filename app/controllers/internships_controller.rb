# Author: Maxwell Barvian
class InternshipsController < AuthenticatedController
  def index
    @internships = GivingBack.internship.where(approved: true, hidden: false)
    @jobs = GivingBack.jobs.where(approved: true, hidden: false)
  end
end
