class Record < ActiveRecord::Base
  belongs_to :scenario
  attr_accessible :param, :act_type, :view, :sleep, :parent_id

  has_many :children, class_name: "Record", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Record"
end
