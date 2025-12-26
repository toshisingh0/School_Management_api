class School < ApplicationRecord
  has_many :users
  has_many :courses
  belongs_to :admin, class_name: "User"

  # belongs_to :admin, class_name: 'User'

  validates :name, presence: true
  validates :address, presence: true

end
