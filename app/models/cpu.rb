class Cpu < ActiveRecord::Base
  attr_accessible :report_id, :report, :trace

  mount_uploader :trace, TraceUploader

  belongs_to :report
  has_many :trace_methods
end
