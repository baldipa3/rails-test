class CreateTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temperatures do |t|
      t.string :locale
      t.integer :degrees, null: false

      t.timestamps
    end
  end
end
