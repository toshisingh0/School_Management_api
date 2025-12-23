class Course < ApplicationRecord
  belongs_to :school
  has_many :batches
  # attr_accessor :school_id 

end
