class Memory < ActiveRecord::Base
  attr_accessible :report_id, :report, :hprof
  mount_uploader :hprof, HprofUploader

  belongs_to :report
  has_many :leak_instances
  has_many :leak_classes
end
