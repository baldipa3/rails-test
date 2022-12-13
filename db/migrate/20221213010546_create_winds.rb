class CreateWinds < ActiveRecord::Migration[6.0]
  def change
    create_table :winds do |t|
      t.string :locale
      t.integer :wind_speed, null: false

      t.timestamps
    end
  end
end
