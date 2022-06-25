class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :works, dependent: :destroy
  has_many :work_comments, dependent: :destroy
  has_many :dailyreports, dependent: :destroy
  has_many :dailyreport_comments, dependent: :destroy
  belongs_to :department

  validates :password, presence: true
  validates :department_id, presence: true
  validates :employee_code, presence: true
  validates :position, presence: true
  validates :email, presence: true
  validates :name, presence: true

end