class CreateClouds < ActiveRecord::Migration[6.0]
  def change
    create_table :clouds do |t|
      t.string :locale
      t.integer :clouds, null: false

      t.timestamps
    end
  end
end
