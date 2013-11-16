require 'yajl'

parser1 = Yajl::Parser.new
parser2 = Yajl::Parser.new

parser3 = Yajl::Parser.new
parser4 = Yajl::Parser.new

parser5 = Yajl::Parser.new
parser6 = Yajl::Parser.new

@project = Project.find_by_name("Smart Share")

@movie_leak_classes = File.open("#{Rails.root}/public/smartshare/movie_histo_hprof.json").read
@movie_sorted_instances = File.open("#{Rails.root}/public/smartshare/movie_sorted_instances.json").read

@audio_leak_classes = File.open("#{Rails.root}/public/smartshare/audio_histo_hprof.json").read
@audio_sorted_instances = File.open("#{Rails.root}/public/smartshare/audio_sorted_instances.json").read

@photo_leak_classes = File.open("#{Rails.root}/public/smartshare/photo_histo_hprof.json").read
@photo_sorted_instances = File.open("#{Rails.root}/public/smartshare/photo_sorted_instances.json").read

@movie_scenario = @project.scenarios.create(name: "movie test", description: "movie test")
@audio_scenario = @project.scenarios.create(name: "audio test", description: "audio click test")
@photo_scenario = @project.scenarios.create(name: "photo test", description: "photo click test")

@movie_report = @project.reports.create(appversion: "Movie",scenario_id: @movie_scenario.id, completed: true, memory_checked: true)
@audio_report = @project.reports.create(appversion: "Audio",scenario_id: @audio_scenario.id, completed: true, memory_checked: true)
@photo_report = @project.reports.create(appversion: "Photo",scenario_id: @photo_scenario.id, completed: true, memory_checked: true)

@movie_memory = @movie_report.create_memory
@audio_memory = @audio_report.create_memory
@photo_memory = @photo_report.create_memory

# @movie_memory.leak_classes.creat(parser1.parse(@movie_leak_classes))
@leak_instances = @movie_memory.leak_instances.create(parser2.parse(@movie_sorted_instances))

print @leak_instances

# @audio_memory.leak_classes.create(parser3.parse(@audio_leak_classes))
# @audio_memory.leak_instances.create(parser4.parse(@audio_sorted_instances))

# @photo_memory.leak_classes.create(parser5.parse(@photo_leak_classes))
# @photo_memory.leak_instances.create(parser6.parse(@photo_sorted_instances))