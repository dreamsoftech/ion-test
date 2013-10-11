class Supplier < ActiveRecord::Base
  attr_accessible :name, :location, :email, :phone, :fax

  has_many :job_sites
  has_and_belongs_to_many :products
end