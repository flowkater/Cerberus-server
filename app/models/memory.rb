class Memory < ActiveRecord::Base
  attr_accessible :report_id, :report

  belongs_to :report
end
