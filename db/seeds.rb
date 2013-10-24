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

@project.reports.create!(appversion: 1.0, scenario_id: @scenario.id)
@project.reports.create!(appversion: 1.2, scenario_id: @scenario.id)
@project.reports.create!(appversion: 1.3, scenario_id: @scenario.id)
@project.reports.create!(appversion: 1.4, scenario_id: @scenario.id)
@project.reports.create!(appversion: 1.5, scenario_id: @scenario.id)