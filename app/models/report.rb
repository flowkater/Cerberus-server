class Report < ActiveRecord::Base
	default_scope order 'created_at DESC'

  attr_accessible :appversion, :project, :scenario_id, :memory_checked, :cpu_checked, :network_checked, :battery_checked, :scenario
  attr_accessor :memory_checked, :cpu_checked, :network_checked, :battery_checked
  attr_writer :current_step

  belongs_to :project
  belongs_to :scenario
  
  has_one :memory
  has_one :cpu
  has_one :network
  has_one :battery

	validates :appversion, presence: true

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def steps
    %w[category scenario check]
  end

	def created_at_date
		created_at.strftime("%d %b %Y")
	end
end
