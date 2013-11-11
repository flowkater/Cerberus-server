object @record
attribute :id, :act_type, :param, :sleep, :view

child :children => :children do
	extends 'scenarios/v1/show'
end