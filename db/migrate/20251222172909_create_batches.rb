class CreateBatches < ActiveRecord::Migration[8.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.uuid :course_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
