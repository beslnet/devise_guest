class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :person, foreign_key: true
      t.references :matched_person, index: true

      t.timestamps null: false
    end
    
    add_index :matches, [:person_id, :matched_person_id], unique: true
    add_index :matches, :person_id, unique: true
    add_foreign_key :matches, :people, column: :matched_person_id
  end
end
