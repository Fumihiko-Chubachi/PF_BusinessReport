class DailyreportComment < ApplicationRecord
  
  belongs_to :dailyreport
  belongs_to :user
  
  validates :comment, presence: true

end