class LatencyMethod < ActiveRecord::Base
	default_scope order('latency DESC').limit(10)

  belongs_to :network
  attr_accessible :class_name, :latency, :line_number, :name, :request_url
end
