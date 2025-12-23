class CreateProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :progresses do |t|
      t.uuid :user_id
      t.uuid :batch_id
      t.integer :percentage

      t.timestamps
    end
  end
end
