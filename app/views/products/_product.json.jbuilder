json.extract! product, :id, :name, :description, :amount, :seller_id, :shop_id, :created_at, :updated_at
json.url product_url(product, format: :json)
