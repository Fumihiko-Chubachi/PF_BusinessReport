class Dailyreport < ApplicationRecord

  #アソシエーション
  has_many :dailyreport_comments, dependent: :destroy
  belongs_to :user

  #バリデーション
  validates :objective, presence: true
  validates :summary, presence: true
  validates :introspection, presence: true
  validates :improvement, presence: true
  validates :impression, presence: true

end