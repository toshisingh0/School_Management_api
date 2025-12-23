class ChangeUsersSchoolIdToInteger < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :school_id
    add_column :users, :school_id, :integer
  end

  def down
    remove_column :users, :school_id
    add_column :users, :school_id, :uuid
  end
end
