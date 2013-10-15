module HomeHelper

	def active_job_site_class(params)
		return 'active' if !@job_site.nil? && params == @job_site.id
	end
end
