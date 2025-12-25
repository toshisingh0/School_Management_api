class Batch < ApplicationRecord
  belongs_to :course
  has_many :batch_students
  has_many :users, through: :batch_students
  validates :name, presence: true
  # validates :course_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
