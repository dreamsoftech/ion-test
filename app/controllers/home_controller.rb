class HomeController < ApplicationController
  before_filter :authenticate_user!
	
	def index
		@developers = Developer.all
		@developer_id = params[:developer_id] 

		unless params[:job_site_id].nil?
			@job_site = JobSite.find(params[:job_site_id])
			@phases = @job_site.phases unless @job_site.nil?
		end
	end

end