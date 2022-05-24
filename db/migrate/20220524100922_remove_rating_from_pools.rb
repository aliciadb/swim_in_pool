class RemoveRatingFromPools < ActiveRecord::Migration[7.0]
  def change
    remove_column :pools, :rating
  end
end
