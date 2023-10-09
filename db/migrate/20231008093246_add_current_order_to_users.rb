class AddCurrentOrderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :current_order, :integer, default: nil
  end
end