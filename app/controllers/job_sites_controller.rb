class JobSitesController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@job_sites = JobSite.paginate(page: params[:page], per_page: 10)
  end

  def create
  	job_site = JobSite.new(params[:job_site])
  	if job_site.save
  		redirect_to job_sites_path, notice: "New JobSite is successfully created."
  	else
  		redirect_to job_sites_path, notice: "Unable to create new job_site."
  	end
  end

  def update
  	job_site = JobSite.find(params[:id])
  	if job_site.update_attributes params[:job_site]
  		redirect_to job_sites_path, notice: "JobSite is successfully updated."
  	else
  		redirect_to job_sites_path, notice: "Unable to update job_site info."
  	end
  end

  def destroy
		job_site = JobSite.find(params[:id])
		job_site.destroy

  	redirect_to job_sites_path, notice: "JobSite is successfully removed."
	end
end