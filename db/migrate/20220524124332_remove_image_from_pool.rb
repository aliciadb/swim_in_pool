class RemoveImageFromPool < ActiveRecord::Migration[7.0]
  def change
    remove_column :pools, :image
  end
end
