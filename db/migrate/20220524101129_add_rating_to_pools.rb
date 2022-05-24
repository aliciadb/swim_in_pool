class AddRatingToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :rating, :integer, default: 0, null: false
  end
end
