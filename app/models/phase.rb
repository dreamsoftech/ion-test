class Phase < ActiveRecord::Base
  attr_accessible :name

  belongs_to :job_site
  has_many :lots, dependent: :destroy
end