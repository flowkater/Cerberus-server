class Project < ActiveRecord::Base
	before_create :generate_api_key

  attr_accessible :name, :user, :reports

  belongs_to :user
  has_many :reports
  has_many :scenarios
  has_many :eventpaths

  validates :name, presence: true

  def profile_report_number
    reports.size
  end

  def report_latest_appversion
    reports.first.appversion unless reports.empty?
  end

  def reports_period
    "#{reports.first.created_at_date} ~ #{reports.last.created_at_date}"  unless reports.empty?
  end  

  def reports_app_version_count
    arr = reports.collect{|r| r.appversion }
    arr_total_size = arr.size
    arr_uniq = arr.uniq
    result = []
    arr_uniq.each {|a| result << {appversion: a, rate: arr.select{|i| i==a}.size * (100.0 / arr_total_size)}}
    result
  end

  def reports_os_version_count
    arr = reports.collect{|r| r.osversion }
    arr_total_size = arr.size
    arr_uniq = arr.uniq
    result = []
    arr_uniq.each {|a| result << {osversion: a, rate: arr.select{|i| i==a}.size * (100.0 / arr_total_size)}} 
    result
  end

  def reports_trend_memory
    reports.collect{|r| {leak_suspect: r.top_leak_suspect, date: r.updated_at } }
  end

  def reports_trend_cpu
    reports.collect{|r| {cpu_exclusive_time: r.top_cpu_excl, date: r.updated_at } }
  end

  def reports_trend_network
    reports.collect{|r| {latency: r.top_latency, date: r.updated_at } }
  end

  def reports_trend_battery
    reports.collect{|r| {joule: r.top_joule, date: r.updated_at } }
  end
  private 

  def generate_api_key
  	begin
  		self.api_key = SecureRandom.hex(5).upcase
  	end while self.class.exists?(api_key: api_key)
  end
end
