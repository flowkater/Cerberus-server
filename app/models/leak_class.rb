class LeakClass < ActiveRecord::Base
  belongs_to :memory
  attr_accessible :classname, :differencecnt, :totalsize
end
