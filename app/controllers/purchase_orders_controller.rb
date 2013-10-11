class PurchaseOrdersController < ApplicationController
  before_filter :authenticate_user!, :admin_authorization

  def index
  	@purchase_orders = PurchaseOrder.paginate(page: params[:page], per_page: 10)
  end

  def create
  	purchase_order = PurchaseOrder.new(params[:purchase_order])
  	if purchase_order.save
  		redirect_to purchase_orders_path, notice: "New PurchaseOrder is successfully created."
  	else
  		redirect_to purchase_orders_path, notice: "Unable to create new purchase_order."
  	end
  end

  def update
  	purchase_order = PurchaseOrder.find(params[:id])
  	if purchase_order.update_attributes params[:purchase_order]
  		redirect_to purchase_orders_path, notice: "PurchaseOrder is successfully updated."
  	else
  		redirect_to purchase_orders_path, notice: "Unable to update purchase_order info."
  	end
  end

  def destroy
		purchase_order = PurchaseOrder.find(params[:id])
		purchase_order.destroy

  	redirect_to purchase_orders_path, notice: "PurchaseOrder is successfully removed."
	end

  private

  def admin_authorization
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
  end
end