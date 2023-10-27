class AddAdditionalFieldsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :email, :string
    add_column :orders, :full_name, :string
    add_column :orders, :phone, :string
    add_column :orders, :address, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :tracking_number, :string
  end
end
