class SchoolAdmin < ApplicationRecord
  belongs_to :school
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :school_id, presence: true
end
