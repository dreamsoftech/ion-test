class Developer < ActiveRecord::Base
  attr_accessible :name, :contact_name, :contact_email, :status

  has_many :job_sites, dependent: :destroy
end
