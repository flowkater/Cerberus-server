class Event < ActiveRecord::Base
  belongs_to :project
  attr_accessible :tag_name
end
