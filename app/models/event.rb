class Event < ActiveRecord::Base
  belongs_to :eventpath
  attr_accessible :index, :event, :size

  has_many :children, class_name: "Event", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Event"
end
