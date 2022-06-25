class Dailyreport < ApplicationRecord

  has_many :dailyreport_comments, dependent: :destroy
  belongs_to :user

  validates :objective, presence: true
  validates :summary, presence: true
  validates :introspection, presence: true
  validates :improvement, presence: true

end