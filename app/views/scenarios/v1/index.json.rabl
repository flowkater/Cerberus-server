collection @scenarios

attributes :id, :name, :description

child :records do
  attributes :act_type, :view, :param, :sleep
end