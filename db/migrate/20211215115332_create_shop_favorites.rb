class CreateShopFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
