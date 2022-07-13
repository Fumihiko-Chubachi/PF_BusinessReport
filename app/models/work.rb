class Work < ApplicationRecord

  #ステータス変更用のenum設定
  enum progress_status: { unanswered: 0, checking: 1, examination: 2, possible: 3, impossible: 4, in_progress: 5, completion:6 }
  
  #アソシエーション
  has_many :work_comments, dependent: :destroy
  belongs_to :user

  #バリデーション
  validates :title, presence: true
  validates :purpose, presence: true
  validates :background, presence: true
  validates :body, presence: true

end