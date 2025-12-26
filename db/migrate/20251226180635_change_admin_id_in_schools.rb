class ChangeSchoolIdTypeInCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :school_id_int, :bigint
    add_index :courses, :school_id_int

    # migrate data if needed
    Course.reset_column_information
    Course.find_each do |course|
      course.update_column(:school_id_int, course.school_id) if course.school_id.present?
    end

    remove_column :courses, :school_id, :uuid
    rename_column :courses, :school_id_int, :school_id
  end
end
