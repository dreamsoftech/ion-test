class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string	:sku
    	t.string	:name
    	t.decimal	:price
    	
    	t.references :unit
    	t.attachment :photo
      t.timestamps
    end
  end
end
