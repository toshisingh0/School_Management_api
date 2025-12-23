class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.uuid :school_id

      t.timestamps
    end
  end
end
