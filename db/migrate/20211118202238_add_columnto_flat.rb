class AddColumntoFlat < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :rating, :float
  end
end
