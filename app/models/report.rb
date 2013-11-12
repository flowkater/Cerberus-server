class Report < ActiveRecord::Base
	default_scope where('completed = ?',true).order('created_at DESC')

  attr_accessible :appversion, :project, :scenario_id, :time_for_profiling, :osversion,
                :memory_checked, :cpu_checked, :network_checked, :battery_checked,
                :completed, :scenario_test, :error_status

  belongs_to :project
  belongs_to :scenario
  
  has_one :memory
  has_one :cpu
  has_one :network, autosave: false
  has_one :battery, autosave: false

  def top_leak_suspect
    memory.leak_instances.first.leak_suspect unless memory.leak_instances.empty? if memory_checked
  end

  def top_cpu_excl
    cpu.trace_methods.first.excl unless cpu.trace_methods.empty? if cpu_checked
  end

  def top_latency
    network.latency_methods.first.latency unless network.latency_methods.empty? if network_checked
  end

  def top_joule
    battery.components.first.joule unless battery.components.empty? if battery_checked
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

