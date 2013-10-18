class Event < ActiveRecord::Base
  attr_accessible :summary, :type

  belongs_to :user
end
