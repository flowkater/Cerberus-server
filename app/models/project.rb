class Project < ActiveRecord::Base
  attr_accessible :name, :user, :reports

  belongs_to :user
  has_many :reports
  has_many :scenarios

  validates :name, presence: true
end
