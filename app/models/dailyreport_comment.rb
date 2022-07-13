class DailyreportComment < ApplicationRecord

  #アソシエーション
  belongs_to :dailyreport
  belongs_to :user

  #バリデーション
  validates :comment, presence: true

end