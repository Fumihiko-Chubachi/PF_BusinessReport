class Dailyreport < ApplicationRecord
  has_many :dailyreport_comments, dependent: :destroy
  belongs_to :user
end