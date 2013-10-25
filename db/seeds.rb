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

@report5.create_memory
@report5.create_network
@report5.create_cpu