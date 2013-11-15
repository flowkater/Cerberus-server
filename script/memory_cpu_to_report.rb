parser1 = Yajl::Parser.new
parser2 = Yajl::Parser.new

@project = Project.last

@leak_classes = File.open("#{Rails.root}/public/system/histo_hprof.json").read
@sorted_instances = File.open("#{Rails.root}/public/system/sorted_instances.json").read
# @usr_tree_dmtrace = File.open("#{Rails.root}/public/system/usr_tree_dmtrace.json").read

@scenario = @project.scenarios.create(name: "photo test")

@report = @project.reports.create(appversion: "Photo",scenario_id: @scenario.id, completed: true, memory_checked: true)

@memory = @report.create_memory

@memory.leak_classes.create(parser1.parse(@leak_classes))
@memory.leak_instances.create(parser2.parse(@sorted_instances))
# @cpu.trace_methods.create(JSON.parse(@usr_tree_dmtrace))	