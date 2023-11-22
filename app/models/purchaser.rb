class Purchaser < ApplicationRecord

    belongs_to :authentication

    paginates_per 10
    validates :purchase_count, presence: true, numericality: { greater_than_equal_to: 0 }
    validates :item_price, presence: true, numericality: { greater_than_equal_to: 0 }
    
    #scope :find_purchaser_name, -> (current_user, order_purchaser_name) { where("authentication_id = ? AND purchaser_name LIKE ?", current_user, "%#{order_purchaser_name}%") }

    #scope :find_item_description, -> (current_user, order_item_description) { where("authentication_id = ? AND item_description LIKE ?", current_user, "%#{order_item_description}%")}
    
    #scope :find_merchant_address, -> (current_user, order_merchant_address) { where("authentication_id = ? AND merchant_address LIKE ?", current_user, "%#{order_merchant_address}%")}

    scope :search, -> (order_purchaser_name, order_item_description, order_merchant_address) { where("purchaser_name LIKE ? AND item_description LIKE ? AND merchant_address LIKE ?", order_purchaser_name, order_item_description, order_merchant_address) }
end
