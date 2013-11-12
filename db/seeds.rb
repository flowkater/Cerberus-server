# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user = User.create(email: "foobar@foobar.com", password:"foobarfoo", password_confirmation:"foobarfoo")
@project = @user.projects.create!(name: "Today Breaker")
@user.projects.create!(name: "KaKaoTalk")
@user.projects.create!(name: "Wind Runner")
@user.projects.create!(name: "Study Mate")

@scenario = @project.scenarios.create!(name: "A Scenario", description: "Many users used this A Scenario")
@project.scenarios.create!(name: "B Scenario", description: "Many users used this B Scenario")
@project.scenarios.create!(name: "C Scenario", description: "Many users used this C Scenario")
@project.scenarios.create!(name: "D Scenario", description: "Many users used this D Scenario")

# Record dummy data
@s = @scenario.records.create!(act_type: "StartActivity", view: "MainActivity", param: "", sleep: 3000, parent_id: nil)
@s1 = @scenario.records.create!(act_type: "Click", view: "R.id.button1", param: "", parent_id: @s.id)
@s2 = @scenario.records.create!(act_type: "EditTextClick", view: "R.id.edit1", param: 0, parent_id: @s1.id)
@s3 = @scenario.records.create!(act_type: "enterText", view: "Test", param: "", parent_id: @s2.id)
@s4 = @scenario.records.create!(act_type: "Click", view: "R.id.button2", param: "", parent_id: @s3.id)


@report1 = @project.reports.create!(appversion: 1.0,osversion: 4.1 ,scenario_id: @scenario.id, time_for_profiling: 120)
@report2 = @project.reports.create!(appversion: 1.2,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 720)
@report3 = @project.reports.create!(appversion: 1.3,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 620)
@report4 = @project.reports.create!(appversion: 1.4,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 3534)
@report5 = @project.reports.create!(appversion: 1.5,osversion: 4.1, scenario_id: @scenario.id, time_for_profiling: 750)

@report1.create_memory
@report1.create_battery
@report1.create_network
@report1.create_cpu

@report2.create_memory
@report2.create_battery

@report3.create_memory
@report3.create_cpu

@report4.create_memory
@report4.create_battery
@report4.create_cpu

@memory = @report5.create_memory
@network = @report5.create_network
@battery = @report5.create_battery
@cpu = @report5.create_cpu

# CPU trace_methods dummy data
@trace_method_param = {"index"=>1, "total"=>"58.4%", "self"=>"0.2%", "calls"=>6, "excl"=>3253, "methodName"=>"edu/umich/PowerTutor/components/PowerComponent.run ()V", "children_attributes"=>[{"index"=>2, "total"=>"35.4%", "self"=>"13.6%", "calls"=>15, "excl"=>137183, "methodName"=>"edu/umich/PowerTutor/components/CPU.calculateIteration (J)Ledu/umich/PowerTutor/service/IterationData;", "children_attributes"=>[{"index"=>7, "total"=>"15.1%", "self"=>"9.3%", "calls"=>1256, "excl"=>40001, "methodName"=>"edu/umich/PowerTutor/util/SystemInfo.getPidUsrSysTime (I[J)Z", "children_attributes"=>[]}, {"index"=>22, "total"=>"7.2%", "self"=>"4.2%", "calls"=>462, "excl"=>8554, "methodName"=>"edu/umich/PowerTutor/util/SystemInfo.getUidForPid (I)I", "children_attributes"=>[]}, {"index"=>77, "total"=>"1.7%", "self"=>"0.6%", "calls"=>15, "excl"=>297, "methodName"=>"edu/umich/PowerTutor/util/SystemInfo.getPids ([I)[I", "children_attributes"=>[]}, {"index"=>80, "total"=>"1.5%", "self"=>"33.2%", "calls"=>1271, "excl"=>14153, "methodName"=>"edu/umich/PowerTutor/components/CPU$CpuStateKeeper.updateState (JJJJ)V", "children_attributes"=>[]}]}, {"index"=>8, "total"=>"12.5%", "self"=>"0.2%", "calls"=>15, "excl"=>886, "methodName"=>"edu/umich/PowerTutor/components/LCD.calculateIteration (J)Ledu/umich/PowerTutor/service/IterationData;", "children_attributes"=>[{"index"=>9, "total"=>"12.1%", "self"=>"2.4%", "calls"=>15, "excl"=>8355, "methodName"=>"edu/umich/PowerTutor/util/ForegroundDetector.getForegroundUid ()I", "children_attributes"=>[{"index"=>22, "total"=>"7.2%", "self"=>"4.2%", "calls"=>462, "excl"=>8554, "methodName"=>"edu/umich/PowerTutor/util/SystemInfo.getUidForPid (I)I", "children_attributes"=>[]}]}]}, {"index"=>11, "total"=>"8.9%", "self"=>"8.5%", "calls"=>15, "excl"=>21390, "methodName"=>"edu/umich/PowerTutor/components/Threeg.calculateIteration (J)Ledu/umich/PowerTutor/service/IterationData;", "children_attributes"=>[{"index"=>39, "total"=>"3.0%", "self"=>"4.4%", "calls"=>474, "excl"=>3740, "methodName"=>"edu/umich/PowerTutor/components/Threeg.readLongFromFile (Ljava/lang/String;)J", "children_attributes"=>[]}]}]};
@cpu.trace_methods.create(@trace_method_param)

# Network latency_methods dummy data
@network.latency_methods.create(name: "doInBackground", class_name: "NetworkTask", request_url: "http://10.0.2.2:8080/JsonTest", line_number: 114, latency: 2014)
@network.latency_methods.create(name: "postNetworkExecute", class_name: "JsonNetwork", request_url: "http://search.naver.com/search.naver?where=nexearch&query=%3%2&ie=utf8&sm=tab_she&qdt=0", line_number: 76, latency: 1099)
@network.latency_methods.create(name: "getWebImage", class_name: "WebImageLoader", request_url: "http://postfiles3.naver.net/20130528_130/dh9289_1369720453251oXLWc_JPEG/naver_com_20130528_145325.jpg?type=w3", line_number: 43, latency: 3018)
@network.latency_methods.create(name: "doInBackground", class_name: "NetworkTask", request_url: "http://10.0.2.2:8080/JsonTest", line_number: 114, latency: 2010)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3097)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3088)
@network.latency_methods.create(name: "getImageList", class_name: "BoardActivity", request_url: "http://10.0.2.2:8080/file/image.do", line_number: 298, latency: 3109)

# Battery componetns dummy data
@battery.components.create(name: "GPS", joule: 58)
@battery.components.create(name: "LCD", joule: 855)
@battery.components.create(name: "CPU", joule: 120)
@battery.components.create(name: "WIFI", joule: 38)
@battery.components.create(name: "3G", joule: 90)
@battery.components.create(name: "Audio", joule: 45)

