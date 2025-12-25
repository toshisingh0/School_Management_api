class EnrollmentRequest < ApplicationRecord
  belongs_to :user
  belongs_to :batch

  enum :request_status, {
    pending: 0,
    approved: 1,
    rejected: 2
  }

  validates_uniqueness_of :user_id, scope: :batch_id
end
