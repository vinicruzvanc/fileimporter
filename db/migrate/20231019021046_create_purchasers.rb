class CreatePurchasers < ActiveRecord::Migration[7.0]
  def change
    create_table "purchasers", force: :cascade do |t|
      t.string "purchaser_name"
      t.string "item_description"
      t.float "item_price"
      t.integer "purchase_count"
      t.float "total_income"
      t.string "merchant_address"
      t.string "merchant_name"
      t.timestamps
    end
  end
end
