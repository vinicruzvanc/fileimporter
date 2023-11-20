class AddUserRole < ActiveRecord::Migration[7.0]
  def change
    add_reference :authentications, :user_role
  end
end
