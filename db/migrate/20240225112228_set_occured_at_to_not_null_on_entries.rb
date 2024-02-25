class SetOccuredAtToNotNullOnEntries < ActiveRecord::Migration[7.1]
  def change
    change_column_null :entries, :occurred_at, false
  end
end
