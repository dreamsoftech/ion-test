class Phase < ActiveRecord::Base
  attr_accessible :name

  belongs_to :job_site
  has_many :lots, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy

  def left_budget_percent
  	total_percent = 0
  	lots.each do |lot|
  		total_percent += lot.left_budget_percent
  	end
  	if lots.count == 0
  		return 100 
  	else
  		return total_percent / lots.count
  	end
  end
end