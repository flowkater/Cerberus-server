# encoding: UTF-8
require 'spec_helper'

describe Project do
	context 'is validation check' do
  	subject{Project.new}
  	it {should_not be_valid}	
  	it {expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)}
  end

	subject(:project){Project.new(name: "todaybreaker", reports: [report1, report2])}
	let(:report1){Report.new(appversion: 1.5)}
	let(:report2){Report.new(appversion: 1.0)}

  it {should respond_to(:name)}
  its(:name){should match(/todaybreaker/)}

  it "include reports" do
  	project.reports.should include(report1)
  	project.reports.should include(report2)
  end

  it "changes number of Projects" do
  	expect{project.save}.to change{ Project.count }.by(1)
  end
end
