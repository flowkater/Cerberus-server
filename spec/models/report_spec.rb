require 'spec_helper'

describe Report do
	context "is validation check" do
		subject(:report){Report.new}
		it {should_not be_valid}
	end

	subject(:report){Report.new(appversion: 0.1, project: project)}
	let(:project){Project.new(name: 'todaybreaker')}

	its(:appversion){should be_an_instance_of(Float)}
	its(:project){should == project}
end
