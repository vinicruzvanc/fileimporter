class Purchaser < ApplicationRecord
    paginates_per 10
    validates :purchase_count, presence: true, numericality: { greater_than_equal_to: 0 }
    validates :item_price, presence: true, numericality: { greater_than_equal_to: 0 }

    scope :purchaser_name_list, -> { where('purchaser_name order by purchaser_name desc')}
    scope :purchaser_item_desc_list, -> { where()}

end
