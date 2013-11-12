class Report < ActiveRecord::Base
	default_scope order 'created_at DESC'

  attr_accessible :appversion, :project, :scenario_id, :time_for_profiling, :osversion,
                :memory_checked, :cpu_checked, :network_checked, :battery_checked

  belongs_to :project
  belongs_to :scenario
  
  has_one :memory
  has_one :cpu
  has_one :network, autosave: false
  has_one :battery, autosave: false

  def top_latency
    network.latency_methods.first.latency
  end

  def top_joule
    battery.components.first.joule
  end

	# validates :appversion, presence: true

  def categories
    categories = []
    categories << "Memory" if memory
    categories << "CPU" if cpu
    categories << "Network" if network
    categories << "Battery" if battery
    categories
  end

	def created_at_date
		created_at.strftime("%d %b %Y")
	end
end

