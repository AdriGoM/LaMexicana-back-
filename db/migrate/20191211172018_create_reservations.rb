class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :people
      t.string :phone
      t.string :date
      t.string :observation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
