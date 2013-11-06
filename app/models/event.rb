class Event < ActiveRecord::Base
  belongs_to :eventpath
  attr_accessible :tag_name
end
