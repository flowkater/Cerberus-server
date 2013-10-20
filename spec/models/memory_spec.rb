require 'spec_helper'

describe Memory do
	subject(:memory){Memory.new(report: report)}
	let(:report){Report.new(appversion: 0.1, project: project)}
	let(:project){Project.new(name: 'todaybreaker')}

	it{should respond_to(:report)}
end
