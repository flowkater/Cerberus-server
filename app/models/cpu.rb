class Cpu < ActiveRecord::Base
  attr_accessible :report_id, :report

  belongs_to :report
  has_many :trace_methods
end
