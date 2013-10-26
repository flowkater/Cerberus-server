class TraceMethod < ActiveRecord::Base
	default_scope order 'usecs DESC'
  belongs_to :cpu
  attr_accessible :name, :self_time_rate, :sum_time_rate, :usecs, :call_index

  validates :name, presence: true
  validates :self_time_rate, presence: true
  validates :sum_time_rate, presence: true
  validates :usecs, presence: true
  validates :call_index, presence: true
end
