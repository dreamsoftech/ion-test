class JobSite < ActiveRecord::Base
  attr_accessible :name, :location, :developer_id, :user_id, :supplier_id

  belongs_to :developer
  belongs_to :user
  belongs_to :supplier

  has_many :phases, dependent: :destroy

end