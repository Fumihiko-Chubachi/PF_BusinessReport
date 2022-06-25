class WorkComment < ApplicationRecord

  belongs_to :work
  belongs_to :user
  
  validates :comment, presence: true
  
end