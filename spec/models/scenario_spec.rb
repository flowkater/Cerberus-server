require 'spec_helper'

describe Scenario do
  context "not any attirbutes validation check" do
  	it{should_not be_valid}
  end

  it{should respond_to(:name)}
  it{should respond_to(:description)}
  it{should respond_to(:project)}
end
