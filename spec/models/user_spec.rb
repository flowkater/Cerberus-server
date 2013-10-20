require 'spec_helper'

describe User do
	subject(:user){User.new(email: 'foobar@foobar.com',password: 'foobarfoo', password_confirmation: 'foobarfoo')}
	it{should respond_to(:email)}
	it{should respond_to(:projects)}
end
