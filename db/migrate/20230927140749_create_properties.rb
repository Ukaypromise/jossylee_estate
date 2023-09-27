class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :property_type
      t.string :location
      t.decimal :price
      t.integer :plot_size
      t.string :property_status
      t.date :availability
      t.string :owner_agent

      t.timestamps
    end
  end
end
