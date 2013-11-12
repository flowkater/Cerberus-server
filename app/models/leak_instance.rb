class LeakInstance < ActiveRecord::Base
	default_scope order 'leak_suspect DESC'
  belongs_to :memory

  has_many :children, class_name: "LeakInstance", foreign_key: "parent_id"
  belongs_to :parent, class_name: "LeakInstance"

  accepts_nested_attributes_for :children
  attr_accessible :instancename, :instanceid, :size, :leak_suspect, :parent_id, :children_attributes

  def parent_level(count = 0)
		return count unless parent
		count = count + 1
		parent.parent_level(count)
	end
end
