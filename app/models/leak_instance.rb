class LeakInstance < ActiveRecord::Base
	default_scope order('leak_suspect DESC')
  belongs_to :memory

  has_many :children, class_name: "LeakInstance", foreign_key: "parent_id"
  belongs_to :parent, class_name: "LeakInstance"

  accepts_nested_attributes_for :children
  attr_accessible :instancename, :instanceid, :size, :leak_suspect, :parent_id, :children_attributes

  acts_as_tree

  def hash_to_html(hash = hash_tree, level=0)
    result = []
    hash.each do |key,value|
      classname = 'badge' if level == 0
      classname = 'badge badge-red' if level == 1
      classname = 'badge badge-gray' if level == 2
      classname = 'badge badge-green' if level == 3
      classname = 'badge badge-blue' if level == 4
      classname = 'badge badge-dark-red' if level == 5
      classname = 'badge badge-black' if level == 6
      classname = 'badge badge-cyan' if level == 7
      classname = 'badge badge-purple' if level == 8
      classname = 'badge' if level == 9
      classname = 'badge badge-red' if level == 10
      classname = 'badge badge-purple' if level == 11
      classname = 'badge badge-gray' if level == 12
      classname = 'badge badge-green' if level == 13
      classname = 'badge badge-blue' if level == 14
      classname = 'badge badge-dark-red' if level == 15
      classname = 'badge badge-black' if level == 16
      classname = 'badge badge-cyan' if level == 17
      classname = 'badge badge-purple' if level == 18
      result << "<tr><td><div style='margin-left:#{(level * 20)}px;'><span class='"+classname+"'>#{(level)}</span>&nbsp;#{key.instancename}</div></td><td></td><td></td></tr>"
      result << hash_to_html(value, level + 1) if value.is_a?(Hash)
    end

   result.join("")
  end

  def leak_tree_html
    "<div class='container'><div class='box'><div class='box-content'><table class='table table-normal'><thead><tr><td>Instance</td><td style='width:400px;'>Leak Suspect(%)</td><td style='width:400px;'>Heap Size</td></tr></thead><tbody>" + hash_to_html + "</tbody></table></div></div></div>"
  end

  def parent_level(count = 0)
		return count unless parent
		count = count + 1
		parent.parent_level(count)
	end
end
