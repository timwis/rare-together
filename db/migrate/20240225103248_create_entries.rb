class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :occurred_at
      t.text :body

      t.timestamps
    end
    
    create_table :entries_symptoms, primary_key: [:entry_id, :symptom_id] do |t|
      t.belongs_to :entry
      t.belongs_to :symptom
    end
  end
end
