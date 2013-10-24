class ProductsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@products = Product.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @products}
      format.json {
        products_url = Array.new
        @products.each do |product|
          products_url.push product.photo.url(:medium)
        end
        render json: products_url
      }
    end
  end

  def create
  	product = Product.new(params[:product])
  	if product.save
      create_event("Product(#{product.name}) is created.")
      redirect_to root_path(product_id: product.id)
  		# redirect_to products_path, notice: "New Product is successfully created."
  	else
  		redirect_to products_path, notice: "Unable to create new product."
  	end
  end

  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
  	product = Product.find(params[:id])
  	if product.update_attributes params[:product]
      create_event("Product(#{product.name}) is updated.")
  		redirect_to products_path, notice: "Product is successfully updated."
  	else
  		redirect_to products_path, notice: "Unable to update product info."
  	end
  end

  def destroy
		product = Product.find(params[:id])
		product.destroy
    create_event("Product(#{product.name}) is deleted.")

  	redirect_to products_path, notice: "Product is successfully removed."
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