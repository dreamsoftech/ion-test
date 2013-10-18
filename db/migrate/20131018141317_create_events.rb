class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.references :user
    	t.string :type
    	t.string :summary

      t.timestamps
    end
  end
end
