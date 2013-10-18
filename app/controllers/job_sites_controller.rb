class JobSitesController < ApplicationController
  before_filter :authenticate_user!, :admin_authorization

  def index
  	@job_sites = JobSite.paginate(page: params[:page], per_page: 10)
    @supervisors = User.supervisor

    if @supervisors.count == 0
      redirect_to users_path, notice: "There is no supervisors. Please add supervisor first"
    end

    if Developer.count == 0
      redirect_to developers_path, notice: "There is no developers. Please add developer first"
    end

    if @job_sites.empty?
      flash[:error] = "There is no existing job sites."
    end
  end

  def show
    @job_site = JobSite.find(params[:id])
    @phases = @job_site.phases
    @phase = Phase.new
  end

  def create
  	job_site = JobSite.new(params[:job_site])
  	if job_site.save
      create_event("Job site(#{job_site.name}) is created.")
  		
      redirect_to job_sites_path, notice: "New JobSite is successfully created."
  	else
  		redirect_to job_sites_path, notice: "Unable to create new job_site."
  	end
  end

  def update
  	job_site = JobSite.find(params[:id])
  	if job_site.update_attributes params[:job_site]
      create_event("Job site(#{job_site.name}) is updated.")
  		
      redirect_to job_sites_path, notice: "JobSite is successfully updated."
  	else
  		redirect_to job_sites_path, notice: "Unable to update job_site info."
  	end
  end

  def destroy
		job_site = JobSite.find(params[:id])
		job_site.destroy
    create_event("Job site(#{job_site.name}) is deleted.")

  	redirect_to job_sites_path, notice: "JobSite is successfully removed."
	end

  private

  def admin_authorization
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
  end

  def create_event(summary)
    event = Event.new
    event.summary = summary
    event.user_id = current_user.id
    event.save
  end
end