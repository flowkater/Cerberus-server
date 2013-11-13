class Report < ActiveRecord::Base
	default_scope order('created_at DESC')

  scope :is_completed, where('completed = ?',true)

  attr_accessible :appversion, :project, :scenario_id, :time_for_profiling, :osversion,
                :memory_checked, :cpu_checked, :network_checked, :battery_checked,
                :completed, :scenario_test, :error_status, :app_icon

  mount_uploader :app_icon, AppIconUploader

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
    cpu.max_excl unless cpu.trace_methods.empty? if cpu_checked
  end

  def top_latency
    network.latency_methods.first.latency unless network.latency_methods.empty? if network_checked
  end

  def top_joule
    battery.components.first.joule unless battery.components.empty? if battery_checked
  end

  def memory_cpu_process
    hprof1 = "#{Rails.root}/public#{memory.hprof1}".gsub(/dump1.hprof/,'')
    hprof2 = "#{Rails.root}/public#{memory.hprof2}".gsub(/dump2.hprof/,'')
    trace = "#{Rails.root}/public#{cpu.trace}".gsub(/dmtrace.trace/,'')
    result = `java -jar #{Rails.root}/public/cerberus.jar #{hprof1} #{hprof2} #{trace}`
    puts result

    histo_json = File.open("#{hprof1}histo_hprof.json").read
    instance_json = File.open("#{hprof1}sorted_instances.json").read
    trace_json = File.open("#{trace}usr_tree_dmtrace.json").read


    memory.leak_instances.create(JSON.parse(instance_json))
    memory.leak_classes.create(JSON.parse(histo_json))
    cpu.trace_methods.create(JSON.parse(trace_json))
    
  end

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

