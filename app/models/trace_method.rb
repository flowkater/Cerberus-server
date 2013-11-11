class TraceMethod < ActiveRecord::Base
	default_scope order 'excl DESC'
  belongs_to :cpu
  attr_accessible :name, :self_time_rate, :sum_time_rate, :usecs, :call_index

  has_many :children, class_name: "TraceMethod", foreign_key: "parent_id"
  belongs_to :parent, class_name: "TraceMethod"
end
