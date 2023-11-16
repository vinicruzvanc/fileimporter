class Authentication < ApplicationRecord
   # belongs_to :login_user
    validates :username, presence: true, allow_blank: false
    validates :password, presence: true, allow_blank: false
    validates_length_of :password, minimum: 5, maximum: 15
    validates_confirmation_of :password
end
