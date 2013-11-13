class Component < ActiveRecord::Base
	default_scope order("joule desc")

  belongs_to :battery
  attr_accessible :cpu, :gps, :wifi, :threeg, :begin
end
