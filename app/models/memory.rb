class Memory < ActiveRecord::Base
  attr_accessible :report_id, :report, :hprof
  mount_uploader :hprof, HprofUploader

  belongs_to :report
end
