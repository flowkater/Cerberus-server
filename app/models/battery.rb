class Battery < ActiveRecord::Base
  attr_accessible :report_id, :report

  has_many :components
  belongs_to :report
end
