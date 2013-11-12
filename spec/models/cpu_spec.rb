require 'spec_helper'

describe Cpu do
  subject(:cpu){Cpu.new(report: report)}
	let(:report){Report.new(appversion: 0.1, project: project)}
	let(:project){Project.new(name: 'todaybreaker')}

	it{should respond_to(:report)}
end
