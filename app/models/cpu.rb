class Cpu < ActiveRecord::Base
  attr_accessible :report_id, :report, :trace

  mount_uploader :trace, TraceUploader

  belongs_to :report
  has_many :trace_methods

  def all_children_trace_methods(methods = trace_methods, children = [])
  	methods.each do |method|
  		children << method.excl
  		unless method.children.empty?
  			all_children_trace_methods(method.children, children)
  		end
  	end
  	children
  end

  def max_excl
    all_children_trace_methods.max
  end
end
