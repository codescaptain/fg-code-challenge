class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.text :description
      t.text :adress
      t.references :seller

      t.timestamps
    end
  end
end
