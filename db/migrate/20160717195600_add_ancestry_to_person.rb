class AddAncestryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :ancestry, :string
    add_index :people, :ancestry
  end
end
