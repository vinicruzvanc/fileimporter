class Purchaser < ApplicationRecord
    validates :purchase_count, presence: true, numericality: { greater_than_equal_to: 0 }
    validates :item_price, presence: true, numericality: { greater_than_equal_to: 0 }
end
