class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :category
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
  end
end
