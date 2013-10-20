class Project < ActiveRecord::Base
  attr_accessible :name, :user, :reports

  has_many :reports

  validates :name, presence: true
end


