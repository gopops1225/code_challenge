class CreateJeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :jeeps do |t|
      t.string :name
      t.integer :year
      t.float :price
      t.integer :miles
      t.integer :bids
      t.string :time_remaining

      t.timestamps
    end
  end
end
