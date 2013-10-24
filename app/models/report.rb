class Report < ActiveRecord::Base
	default_scope order 'created_at DESC'

  attr_accessible :appversion, :project, :scenario_id, :memory_checked, :cpu_checked, :network_checked, :battery_checked
  attr_accessor :memory_checked, :cpu_checked, :network_checked, :battery_checked

  belongs_to :project
  belongs_to :scenario
  
  has_one :memory
  has_one :cpu
  has_one :network
  has_one :battery

	validates :appversion, presence: true

	def created_at_date
		created_at.strftime("%d %b %Y")
	end
end
