class MemoryCpuWorker
	include Sidekiq::Worker

	def perform(report_id)
		report = Report.find(report_id)

		memory = report.memory
		cpu = report.cpu

		h1 = `gzip -d "#{Rails.root}/public#{memory.hprof1}"`
    h2 = `gzip -d "#{Rails.root}/public#{memory.hprof2}"`
    t = `gzip -d "#{Rails.root}/public#{cpu.trace}"`

    hprof1 = "#{Rails.root}/public#{memory.hprof1}".gsub(/dump1.hprof.gz/,'')
    hprof2 = "#{Rails.root}/public#{memory.hprof2}".gsub(/dump2.hprof.gz/,'')
    trace = "#{Rails.root}/public#{cpu.trace}".gsub(/dmtrace.trace.gz/,'')
    result = `java -jar #{Rails.root}/public/cerberus.jar #{hprof1} #{hprof2} #{trace}`

    histo_json = File.open("#{hprof1}histo_hprof.json").read
    instance_json = File.open("#{hprof1}sorted_instances.json").read
    trace_json = File.open("#{trace}usr_tree_dmtrace.json").read

    parser1 = Yajl::Parser.new
    parser2 = Yajl::Parser.new
    parser3 = Yajl::Parser.new

    memory.leak_instances.create(parser1.parse(instance_json))
    memory.leak_classes.create(parser2.parse(histo_json))
    cpu.trace_methods.create(parser3.parse(trace_json))

    report.update_attributes(completed: true)
	end
end