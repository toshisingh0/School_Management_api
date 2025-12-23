class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :address
      t.uuid :admin_id

      t.timestamps
    end
  end
end
