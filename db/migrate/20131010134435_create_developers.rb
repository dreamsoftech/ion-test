class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
    	t.string :name
    	t.string :contact_name
    	t.string :contact_email
    	t.string :status

      t.timestamps
    end
  end
end