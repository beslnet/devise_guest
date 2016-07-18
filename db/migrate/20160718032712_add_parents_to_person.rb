class AddParentsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :sex, :string
    add_column :people, :father_id, :integer
    add_column :people, :mother_id, :integer
    add_column :people, :current_spouse_id, :integer
  end
end
