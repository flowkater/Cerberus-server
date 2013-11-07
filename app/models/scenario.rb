class Scenario < ActiveRecord::Base
	before_create :auto_generate_name

	belongs_to :project
  has_many :reports
  has_many :records

	attr_accessible :description, :name

  private

  def auto_generate_name
  	self.name = "Scenario Tests created at #{Time.now}"
  end
end
