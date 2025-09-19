class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :people_count
      t.datetime :reservation_time
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
