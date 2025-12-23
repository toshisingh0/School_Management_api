class CreateBatchStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :batch_students do |t|
      t.uuid :user_id
      t.uuid :batch_id

      t.timestamps
    end
  end
end
