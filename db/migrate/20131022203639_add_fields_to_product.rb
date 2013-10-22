class AddFieldsToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :description, :string
    add_column :products, :quantity, :string
  end
end