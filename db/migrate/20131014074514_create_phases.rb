class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
    	t.string :name
    	t.references :job_site

      t.timestamps
    end
  end
end
