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
      result << "<tr><td><div style='margin-left:#{(level * 20)}px;'>#{key.instancename}</div></td> <td></td><td></td></tr>"
      result << hash_to_html(value, level + 1) if value.is_a?(Hash)
    end
    result.join("\n")
  end

  def leak_tree_html
    "<div class='container'><div class='box'><div class='box-content'><table class='table table-normal'><thead><tr><td>Instance</td><td style='width:400px;'>Leak Suspect(%)</td><td style='width:400px;'>Heap Size</td></tr></thead><tbody>" + hash_to_html + "</tbody></table></div></div></div>".html_safe
  end

  def parent_level(count = 0)
		return count unless parent
		count = count + 1
		parent.parent_level(count)
	end
end
