class RenameStatusInEnrollmentRequests < ActiveRecord::Migration[8.0]
  def change
    rename_column :enrollment_requests, :status, :request_status
  end
end
