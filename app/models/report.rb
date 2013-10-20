class Report < ActiveRecord::Base
  attr_accessible :appversion, :project

  belongs_to :project
  has_one :memory
  has_one :cpu
  has_one :network
  has_one :battery

	validates :appversion, presence: true
end
