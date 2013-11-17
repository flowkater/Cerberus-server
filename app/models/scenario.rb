class Scenario < ActiveRecord::Base

  scope :just_recording, where('profile = ?', false)

  scope :top4,
    select("scenarios.id,scenarios.name,scenarios.description, count(reports.id) AS reports_count").
    joins(:reports).
    where('scenarios.profile = ? AND scenarios.id IS NOT NULL AND reports.completed = ?', false, true)
    order("reports_count DESC").
    limit(4)

	belongs_to :project
  has_many :reports
  has_many :records

	attr_accessible :description, :name, :profile

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

  def record_node_update
    (1..records.length - 1).each do |i|
      records[i].update_attributes(parent_id: records[i-1].id)
    end
  end
end
