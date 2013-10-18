class SuppliersController < ApplicationController
  before_filter :authenticate_user!, :admin_authorization

  def index
  	@suppliers = Supplier.paginate(page: params[:page], per_page: 10)
    if @suppliers.empty?
      flash[:error] = "There is no existing suppliers."
    end
  end

  def create
  	supplier = Supplier.new(params[:supplier])
    if supplier.save
      product_ids = params[:products].keys

      product_ids.each do |product_id|
        supplier_product = SupplierProduct.new
        supplier_product.product_id = product_id
        supplier_product.supplier_id = supplier.id

        supplier_product.save
      end
      create_event("Supplier(#{supplier.name}) is created.")

  		redirect_to suppliers_path, notice: "New Supplier is successfully created."
  	else
  		redirect_to suppliers_path, notice: "Unable to create new supplier."
  	end
  end

  def show
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
  end

  def new
    @supplier = Supplier.new
    @products = Product.all
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @products = Product.all
    @supplier_products = @supplier.supplier_products
  end

  def update
  	supplier = Supplier.find(params[:id])
  	if supplier.update_attributes params[:supplier]
      create_event("Supplier(#{supplier.name}) is updated.")
  		redirect_to suppliers_path, notice: "Supplier is successfully updated."
  	else
  		redirect_to suppliers_path, notice: "Unable to update supplier info."
  	end
  end

  def destroy
		supplier = Supplier.find(params[:id])
		supplier.destroy
    create_event("Supplier(#{supplier.name}) is deleted.")

  	redirect_to suppliers_path, notice: "Supplier is successfully removed."
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