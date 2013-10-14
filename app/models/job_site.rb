class JobSite < ActiveRecord::Base
  attr_accessible :name, :location, :developer_id, :user_id

  belongs_to :developer
  belongs_to :user
  belongs_to :supplier

  has_many :phase

end