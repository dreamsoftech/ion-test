class CreateJobSites < ActiveRecord::Migration
  def change
    create_table :job_sites do |t|
    	t.string :name
    	t.string :location
    	t.references :user
    	t.references :developer
    	t.references :supplier
    	
      t.timestamps
    end
  end
end
