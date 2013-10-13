class SupplierProductsController < ApplicationController
  before_filter :authenticate_user!, :admin_authorization

  def destroy
		sp = SupplierProduct.find(params[:id])
		sp.destroy

  	redirect_to edit_supplier_path(sp.supplier_id)
	end

  private

  def admin_authorization
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
  end
end