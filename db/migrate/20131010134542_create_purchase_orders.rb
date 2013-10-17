class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
    	t.references :phase
    	t.string		 :note
    	
      t.timestamps
    end
  end
end
