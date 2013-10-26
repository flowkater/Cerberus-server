class Component < ActiveRecord::Base
  belongs_to :battery
  attr_accessible :joule, :name
end
