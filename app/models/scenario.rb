class Scenario < ActiveRecord::Base
  belongs_to :project
  attr_accessible :description, :name

  validates :name, presence: true
  validates :description, presence: true

  has_many :reports
end
