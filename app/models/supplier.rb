class Supplier < ActiveRecord::Base
  attr_accessible :name, :location, :email, :phone, :fax

  has_many :job_sites
  has_many :supplier_products
  has_many :products, :through => :supplier_products
end