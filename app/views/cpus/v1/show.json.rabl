object @trace_method

attributes :id,:methodName,:index,:total,:self,:calls,:excl

child :children => :children do
	extends 'cpus/v1/show'
end