class Component < ActiveRecord::Base
  belongs_to :battery
  attr_accessible :cpu, :gps, :wifi, :threeg, :begin, :audio
end
