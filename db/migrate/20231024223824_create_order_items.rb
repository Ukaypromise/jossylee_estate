class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :property, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tracking_number

      t.timestamps
    end
  end
end
