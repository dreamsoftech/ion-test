class HomeController < ApplicationController
  before_filter :authenticate_user!, :before_query
  layout false, only: ["product_thumbnails"]

	
	def index
		@products = Product.all
		@product = Product.find_by_id(params[:product_id])
		@photo_url = @product.sku unless @product.nil?
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

	def product_thumbnails
  	@products = Product.paginate(page: params[:page], per_page: 10)
		
	end

	private

	def before_query
		@developers = Developer.all
		@developer_id = params[:developer_id] 
	end 
end