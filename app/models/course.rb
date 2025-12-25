class Course < ApplicationRecord
  belongs_to :school
  has_many :batches
  # validates :school_id, presence: true
  validates :name, presence: true
  validates :description, presence: true

end
