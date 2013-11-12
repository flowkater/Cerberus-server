class Network < ActiveRecord::Base
  attr_accessible :report_id, :report

  belongs_to :report
  has_many :latency_methods, autosave: false
end
