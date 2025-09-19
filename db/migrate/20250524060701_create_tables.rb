class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.integer :capacity
      t.boolean :available

      t.timestamps
    end
  end
end
