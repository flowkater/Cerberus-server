require 'spec_helper'

describe Network do
  subject(:network){Network.new(report: report)}
	let(:report){Report.new(appversion: 0.1, project: project)}
	let(:project){Project.new(name: 'todaybreaker')}

	it{should respond_to(:report)}
end
