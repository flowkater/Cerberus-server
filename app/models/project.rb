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
    reports.first.appversion
  end

  def reports_period
    "#{reports.first.created_at_date} ~ #{reports.last.created_at_date}"
  end  

  private 

  def generate_api_key
  	begin
  		self.api_key = SecureRandom.hex(5).upcase
  	end while self.class.exists?(api_key: api_key)
  end
end
