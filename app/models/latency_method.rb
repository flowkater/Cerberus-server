class LatencyMethod < ActiveRecord::Base
  belongs_to :network
  attr_accessible :class_name, :latency, :line_number, :name, :request_url
end
