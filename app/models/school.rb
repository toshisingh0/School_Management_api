class School < ApplicationRecord
  has_many :users
  has_many :courses
   # belongs_to :admin, class_name: 'User'

  # validates :admin_id, presence: true
end
