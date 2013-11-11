class Record < ActiveRecord::Base
  belongs_to :scenario
  attr_accessible :param, :act_type, :view
end
