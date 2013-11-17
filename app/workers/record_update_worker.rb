class RecordUpdateWorker
	include Sidekiq::Worker

	def perform(scenario_id)
		scenario = Scenario.find(scenario_id)
		scenario.record_node_update	
	end
end