class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
    	t.references :phase
    	t.string :name
    	t.decimal :budget

      t.timestamps
    end
  end
end