class Report < ActiveRecord::Base
	default_scope order 'created_at DESC'

  attr_accessible :appversion, :project, :scenario_id, :time_for_profiling, :osversion

  belongs_to :project
  belongs_to :scenario
  
  has_one :memory
  has_one :cpu
  has_one :network
  has_one :battery

	# validates :appversion, presence: true

  def categories
    categories = []
    categories << "memory" if memory
    categories << "cpu" if cpu
    categories << "network" if network
    categories << "battery" if battery
    categories.join(" ")
  end

	def created_at_date
		created_at.strftime("%d %b %Y")
	end
end
