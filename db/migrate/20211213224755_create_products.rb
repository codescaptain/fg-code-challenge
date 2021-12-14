class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :amount, null: false
      t.references :seller, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
