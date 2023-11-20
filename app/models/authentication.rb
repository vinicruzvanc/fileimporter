class Authentication < ApplicationRecord

    belongs_to :user_role

    paginates_per 10

    validates :username, presence: true, uniqueness: true, allow_blank: false
    validates :password, presence: true, allow_blank: false
    validates_length_of :password, minimum: 5, maximum: 15
    validates_confirmation_of :password
    validates :user_role, presence: true, allow_blank: false
end
