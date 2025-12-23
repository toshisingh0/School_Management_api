class CreateEnrollmentRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollment_requests do |t|
      t.uuid :user_id
      t.uuid :batch_id
      t.integer :status

      t.timestamps
    end
  end
end
