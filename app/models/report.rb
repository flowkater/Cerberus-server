class Report < ActiveRecord::Base
  # only show completed report
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
    categories << "Memory" if memory_checked
    categories << "CPU" if cpu_checked
    categories << "Network" if network_checked
    categories << "Battery" if battery_checked
    categories
  end

	def created_at_date
		created_at.strftime("%d %b %Y")
	end
end

