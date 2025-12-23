class User < ApplicationRecord
  enum :role, { admin: 0, school_admin: 1, student: 2 }
	has_secure_password

  belongs_to :school
	has_many :enrollment_requests
	has_many :batch_students
	has_many :batches, through: :batch_students
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: :password_required? 
  validates :school, presence: true

  private

  def password_required?
    new_record? || password.present?
  end
end
