class AddGroupIdColumnToOperations < ActiveRecord::Migration[7.0]
  def change
    add_reference :operations, :group, null: false, foreign_key: true
  end
end
