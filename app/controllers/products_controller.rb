class ProductsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@products = Product.paginate(page: params[:page], per_page: 10)
  end

  def create
  	product = Product.new(params[:product])
  	if product.save
  		redirect_to products_path, notice: "New Product is successfully created."
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
  		redirect_to products_path, notice: "Product is successfully updated."
  	else
  		redirect_to products_path, notice: "Unable to update product info."
  	end
  end

  def destroy
		product = Product.find(params[:id])
		product.destroy

  	redirect_to products_path, notice: "Product is successfully removed."
	end
end