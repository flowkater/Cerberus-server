class LeakInstance < ActiveRecord::Base
  belongs_to :memory
  attr_accessible :name
end
