class Component < ActiveRecord::Base
	default_scope order 'begin ASC'
  belongs_to :battery
  attr_accessible :cpu, :gps, :wifi, :threeg, :begin, :audio
end
