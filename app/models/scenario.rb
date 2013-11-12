class Scenario < ActiveRecord::Base
	before_create :auto_generate_name

  scope :top4,
    select("scenarios.id,scenarios.name,scenarios.description, count(reports.id) AS reports_count").
    joins(:reports).
    order("reports_count DESC").
    limit(4)

	belongs_to :project
  has_many :reports
  has_many :records

	attr_accessible :description, :name

  def latest_report
    reports.first
  end

  def dashboard_top_leak_suspect
    latest_report.top_leak_suspect
  end

  def dashboard_top_cpu_excl
    latest_report.top_cpu_excl
  end
  
  def dashboard_top_latency
    latest_report.top_latency
  end

  def dashboard_top_joule
    latest_report.top_joule
  end

  def dashboard_report_profiling_time
    latest_report.time_for_profiling
  end

  private

  def auto_generate_name
  	self.name = "Scenario Tests created at #{Time.now}"
  end
end
