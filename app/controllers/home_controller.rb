class HomeController < ApplicationController
  before_filter :authenticate_user!, :before_query
	
	def index

		unless params[:job_site_id].nil?
			@job_site = JobSite.find(params[:job_site_id])
			@phases = @job_site.phases unless @job_site.nil?
		end
	end

	def new_purchase_order
		@job_site = JobSite.find_by_id(params[:job_site_id])
		@lot = Lot.find_by_id(params[:lot_id])
		@phase = @lot.phase
		@lots = @phase.lots
		@supplier = @job_site.supplier
		@purchase_order = PurchaseOrder.new
		@purchase_order.phase_id = @phase.id
	end

	private

	def before_query
		@developers = Developer.all
		@developer_id = params[:developer_id] 
	end 
end