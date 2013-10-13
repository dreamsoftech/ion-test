class SupplierProduct < ActiveRecord::Base
  attr_accessible :product_id, :supplier_id

  belongs_to :supplier
  belongs_to :product
end
