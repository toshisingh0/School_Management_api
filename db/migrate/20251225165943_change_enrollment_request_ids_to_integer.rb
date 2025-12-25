class ChangeEnrollmentRequestIdsToInteger < ActiveRecord::Migration[8.0]
  def change
    remove_column :enrollment_requests, :user_id, :uuid
    remove_column :enrollment_requests, :batch_id, :uuid

    add_column :enrollment_requests, :user_id, :integer, null: false
    add_column :enrollment_requests, :batch_id, :integer, null: false

    add_index :enrollment_requests, [:user_id, :batch_id], unique: true
  end
end
