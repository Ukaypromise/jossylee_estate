class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :orderables do |t|
      t.belongs_to :property, null: true, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
