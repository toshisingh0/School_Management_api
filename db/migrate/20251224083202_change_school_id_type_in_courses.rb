class ChangeSchoolIdTypeInCourses < ActiveRecord::Migration[8.0]
  # def up
  #   # Explicitly cast the column data using PostgreSQL syntax.
  #   change_column :courses, :school_id, 'integer USING CAST(school_id AS integer)'
  # end

  def down
    # Note: Reverting this change will result in data loss for school_id values
    change_column :courses, :school_id, :uuid
  end
end
