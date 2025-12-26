class ChangeSchoolIdTypeInCourses < ActiveRecord::Migration[8.0]
  def change
    # new column (safe)
    add_column :courses, :school_id_int, :bigint

    # index (NOT unique)
    add_index :courses, :school_id_int

    # remove old uuid column
    remove_column :courses, :school_id, :uuid

    # rename new column
    rename_column :courses, :school_id_int, :school_id
  end
end
