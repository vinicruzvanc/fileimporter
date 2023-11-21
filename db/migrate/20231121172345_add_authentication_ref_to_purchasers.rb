class AddAuthenticationRefToPurchasers < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchasers, :authentication
  end
end
