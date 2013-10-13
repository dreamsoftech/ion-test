class CreateSupplierProducts < ActiveRecord::Migration
  def change
    create_table :supplier_products do |t|
    	t.references :supplier
    	t.references :product
      t.timestamps
    end
  end
end
