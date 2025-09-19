class AddNameToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :tables, :name, :string
  end
end
