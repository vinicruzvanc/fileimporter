class Purchaser < ApplicationRecord
    paginates_per 10
    validates :purchase_count, presence: true, numericality: { greater_than_equal_to: 0 }
    validates :item_price, presence: true, numericality: { greater_than_equal_to: 0 }
end
