class RemoveQuantityFromOrderables < ActiveRecord::Migration[7.0]
  def change
    remove_column :orderables, :quantity, :integer
  end
end
