class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.integer :rating
      t.text :description
      t.float :price
      t.string :location
      t.string :image
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
