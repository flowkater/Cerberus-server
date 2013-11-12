class Battery < ActiveRecord::Base
  attr_accessible :report_id, :report

  has_many :components, autosave: false
  belongs_to :report
end
