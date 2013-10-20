class Report < ActiveRecord::Base
  attr_accessible :appversion, :project

  belongs_to :project

	validates :appversion, presence: true  
end
