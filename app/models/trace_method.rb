class TraceMethod < ActiveRecord::Base
	default_scope order 'excl DESC'
  belongs_to :cpu

  has_many :children, class_name: "TraceMethod", foreign_key: "parent_id"
  belongs_to :parent, class_name: "TraceMethod"

  accepts_nested_attributes_for :children
  attr_accessible :methodName, :index, :total, :self, :calls, :excl, :parent_id, :children_attributes

	def parent_level(count = 0)
		return count unless parent
		count = count + 1
		parent.parent_level(count)
	end
end
