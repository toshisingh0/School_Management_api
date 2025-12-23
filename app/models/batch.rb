class Batch < ApplicationRecord
	belongs_to :course
	has_many :batch_students
	has_many :users, through: :batch_students

end
