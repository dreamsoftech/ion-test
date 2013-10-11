class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
    	t.string :name
    	t.string :location
    	t.string :email
    	t.string :phone
    	t.string :fax

      t.timestamps
    end

    create_table :suppliers_products do |t|
      t.references :supplier
      t.references :product
      
      t.timestamps
    end
  end
end