class ChangeUuidToIntegerInBatchStudents < ActiveRecord::Migration[8.0]
  def up
    # Add new integer columns
    add_column :batch_students, :user_id_int, :integer
    add_column :batch_students, :batch_id_int, :integer

    # Populate with existing integer IDs if you have a mapping
    # For example, if user IDs are already integers somewhere else
    # Otherwise, assign temporary sequential IDs
    BatchStudent.reset_column_information
    BatchStudent.find_each.with_index(1) do |bs, i|
      bs.update_columns(user_id_int: i, batch_id_int: i) # just example sequential IDs
    end

    # Remove old uuid columns
    remove_column :batch_students, :user_id
    remove_column :batch_students, :batch_id

    # Rename new columns
    rename_column :batch_students, :user_id_int, :user_id
    rename_column :batch_students, :batch_id_int, :batch_id
  end

  def down
    remove_column :batch_students, :user_id
    remove_column :batch_students, :batch_id
    add_column :batch_students, :user_id, :uuid
    add_column :batch_students, :batch_id, :uuid
  end
end
