json.extract! purchaser, :id, :purchaser_name, :item_description, :item_price, :purchase_count, :total_income, :merchant_address, :merchant_name, :created_at, :updated_at
json.url purchaser_url(purchaser, format: :json)
