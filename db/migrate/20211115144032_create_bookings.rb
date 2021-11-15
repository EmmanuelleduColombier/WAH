class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start
      t.date :end
      t.integer :total_price
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
