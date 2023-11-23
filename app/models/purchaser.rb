class Purchaser < ApplicationRecord

    belongs_to :authentication

    paginates_per 10
    validates :purchase_count, presence: true, numericality: { greater_than_equal_to: 0 }
    validates :item_price, presence: true, numericality: { greater_than_equal_to: 0 }
    
    def self.search(purchaser_name, item_description, merchant_address, merchant_name)
        query = self.all
        query = query.where("purchaser_name LIKE ?", "%#{purchaser_name}%") if purchaser_name.present? 
        query = query.where("item_description LIKE ?", "%#{item_description}%") if item_description.present?
        query = query.where("merchant_address LIKE ?", "%#{merchant_address}%") if merchant_address.present?
        query = query.where("merchant_name LIKE ?", "%#{merchant_name}%") if merchant_name.present? 

        query
    end  
end