class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :address
      t.string :room_type
      t.integer :persons
      t.integer :price
      t.boolean :owner_present
      t.boolean :has_pet
      t.boolean :has_computer
      t.boolean :has_coffee
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
