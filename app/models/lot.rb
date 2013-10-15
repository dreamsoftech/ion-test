class Lot < ActiveRecord::Base
  attr_accessible :name, :budget, :phase_id

  belongs_to :phase
end