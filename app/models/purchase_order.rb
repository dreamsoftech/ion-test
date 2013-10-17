class PurchaseOrder < ActiveRecord::Base
  attr_accessible :phase_id, :note

  belongs_to :phase
  has_many :line_items, dependent: :destroy
end